//
//  UserInfoViewController.m
//  CloverTaxi
//
//  Created by Andrew Medvedev on 4/2/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "UserInfoViewController.h"
#import "BasicCell.h"
#import "PaymentViewController.h"
#import "NetworkServiceLayer.h"
#import "Driver.h"
#import "Order.h"

@interface UserInfoViewController () <UITableViewDelegate, UITableViewDataSource>
@property (copy, nonatomic) NSArray<NSDictionary*>* tableCellInfo;
@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Подтверждение";
    
    self.tableCellInfo = @[ @{ @"type" : @(1), @"description" : @"Ваш номер телефона"},
                            @{ @"type" : @(2), @"description" : @"Комментарии к поездке"}
                          ];
}

//------------------------------------------------------------------------------
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


#pragma mark - UITableViewDataSource

//------------------------------------------------------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableCellInfo.count;
}

//------------------------------------------------------------------------------
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([BasicCell class]) forIndexPath:indexPath];
}


#pragma mark - UITableViewDelegate

//------------------------------------------------------------------------------
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIButton* searchButton = [[UIButton alloc]initWithFrame:(CGRect){0, 0, tableView.frame.size.width, 64}];
    searchButton.backgroundColor = [UIColor whiteColor];
    [searchButton setTitle:@"Поиск" forState:UIControlStateNormal];
    [searchButton setTitleColor:[UIColor colorWithRed:0.1647 green:0.6588 blue:0.5333 alpha:1.0] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(actionSearchDriver:) forControlEvents:UIControlEventTouchUpInside];
    return searchButton;
}

//------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 64;
}

//------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView willDisplayCell:(BasicCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell configureCellWithParams:self.tableCellInfo[indexPath.row]];
}


#pragma mark - Actions

//------------------------------------------------------------------------------
- (void)actionSearchDriver:(UIButton*)sender {
    [self driverForRoute:self.order.route];
}


#pragma mark - Helpers

//------------------------------------------------------------------------------
- (void)performSegueWithDriver:(Driver*)driver {
    PaymentViewController* paymentVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:NSStringFromClass([PaymentViewController class])];
    paymentVC.order = self.order;
    paymentVC.driver = driver;
    [self.navigationController pushViewController:paymentVC animated:YES];
}


#pragma mark - Loaders

//------------------------------------------------------------------------------
- (void)driverForRoute:(Route*)route {
    [[NetworkServiceLayer sharedLayer]
     driverForRoute:route
     success:^(NSArray *items) {
         if(items.count > 0) {
             NSInteger index = arc4random()%items.count;
             [self performSegueWithDriver:items[index]];
         }
     } failure:^(NSString *request, NSError *error) {
         [self processError:error];
     }];
}

@end
