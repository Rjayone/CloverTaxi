//
//  BaseViewController.m
//  CloverTaxi
//
//  Created by Andrew Medvedev on 3/4/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//------------------------------------------------------------------------------
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

//------------------------------------------------------------------------------
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

//------------------------------------------------------------------------------
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

//------------------------------------------------------------------------------
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}


#pragma mark - Error processing

//------------------------------------------------------------------------------
- (void)processError:(NSError*) error {
    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"Ошибка" message:error.localizedDescription delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    //[alertView show];
    NSLog(@"%@", error.localizedDescription);
}

//------------------------------------------------------------------------------
- (void)processErrorWithMessage:(NSString*)error {
    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"Ошибка" message:error delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    //[alertView show];
    NSLog(@"%@", error);
}

@end
