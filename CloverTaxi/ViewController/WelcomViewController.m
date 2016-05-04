//
//  ViewController.m
//  CloverTaxi
//
//  Created by Andrew Medvedev on 3/4/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "WelcomViewController.h"
#import "LocationManager.h"
#import "MapsViewController.h"

@interface WelcomViewController ()

@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@end


@implementation WelcomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self beginWelcomAnimation];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didChangeAuthorizationStatus:) name:LocationManagerDidChangeAuthorizationStatusNotification object:nil];
}

//------------------------------------------------------------------------------
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self beginWelcomAnimation];
}

//------------------------------------------------------------------------------
- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


#pragma mark - Animations

//------------------------------------------------------------------------------
- (void)beginWelcomAnimation {
    self.welcomeLabel.alpha = 0.f;
    self.confirmButton.alpha = 0.f;
    self.bottomConstraint.constant += 30;
    
    __weak __typeof(self) wself = self;
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView animateWithDuration:1.2 animations:^{
        wself.bottomConstraint.constant -= 30;
        wself.welcomeLabel.alpha = 1.f;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.4 animations:^{
                wself.confirmButton.alpha = 1.f;
                [wself.view layoutIfNeeded];
            }];
            [wself.view layoutIfNeeded];
        });
    }];
}

#pragma mark - Actions

//------------------------------------------------------------------------------
- (IBAction)actionConfirmGeolocation:(UIButton *)sender {
    [LocationManager sharedManager];
}

//------------------------------------------------------------------------------
- (void)presentMapsViewController {
    MapsViewController* mapsVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:NSStringFromClass([MapsViewController class])];
    UINavigationController* navigationController = [[UINavigationController alloc]initWithRootViewController:mapsVC];
    [self presentViewController:navigationController animated:YES completion:nil];
}


#pragma mark - Notifications

//------------------------------------------------------------------------------
- (void)didChangeAuthorizationStatus:(NSNotification*)notification {
    NSInteger status = [notification.object integerValue];
    if(status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [[NSUserDefaults standardUserDefaults]setObject:@(YES) forKey:@"kGPSPermission"];
        [self presentMapsViewController];
    }
}

@end
