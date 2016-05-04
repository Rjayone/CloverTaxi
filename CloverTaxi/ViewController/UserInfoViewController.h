//
//  UserInfoViewController.h
//  CloverTaxi
//
//  Created by Andrew Medvedev on 4/2/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "BaseViewController.h"

@class Order;

@interface UserInfoViewController : BaseViewController

@property (strong, nonatomic) Order* order;

@end
