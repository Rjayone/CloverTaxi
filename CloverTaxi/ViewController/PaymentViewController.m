//
//  PaymentViewController.m
//  CloverTaxi
//
//  Created by Andrew Medvedev on 3/29/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "PaymentViewController.h"
#import "Route.h"
#import "Order.h"
#import "Driver.h"
#import "Car.h"

@interface PaymentViewController () <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@property (weak, nonatomic) IBOutlet UILabel *toLabel;
@property (weak, nonatomic) IBOutlet UILabel *driverLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *carLabel;
@property (weak, nonatomic) IBOutlet UIImageView *car;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;

@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Подтверждение";
    [self configureRecipetView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


#pragma mark - Actions

//------------------------------------------------------------------------------
- (IBAction)actionPay:(UIButton *)sender {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Ваш заказ принят" message:@"Автомобиль прибудет в течении 3-5 минут." delegate:self cancelButtonTitle:@"ОК" otherButtonTitles:nil];
        [alert show];
    });
}


#pragma mark - Helpers

//------------------------------------------------------------------------------
- (void)configureRecipetView {
    self.dateLabel.text = [Common dateString:[NSDate date]];
    self.fromLabel.text = self.order.startPoint;
    self.toLabel.text = self.order.endPoint;
    self.driverLabel.text = self.driver.fullName;
    self.carLabel.text = self.driver.car.formattedCar;
    self.summaryLabel.text = [NSString stringWithFormat:@"%ld руб.", (long)((long)self.order.price / 100) * 100];
    
    self.car.image = [UIImage imageNamed:self.driver.car.imagePath];
    self.car.layer.borderColor = [UIColor grayColor].CGColor;
    self.car.layer.borderWidth = 1;
    
    self.photo.image = [UIImage imageNamed:self.driver.imagePath];
    self.photo.layer.borderColor = [UIColor grayColor].CGColor;
    self.photo.layer.borderWidth = 1;
}


#pragma mark - Alert

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
