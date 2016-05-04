//
//  PaymentViewController.h
//  CloverTaxi
//
//  Created by Andrew Medvedev on 3/29/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "BaseViewController.h"

@class Driver;
@class Order;

@interface PaymentViewController : BaseViewController

@property (strong, nonatomic) Driver* driver;
@property (strong, nonatomic) Order* order;

@end
