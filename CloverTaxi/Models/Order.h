//
//  Order.h
//  CloverTaxi
//
//  Created by Andrew Medvedev on 3/30/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Route;

@interface Order : NSObject

@property (strong, nonatomic) Route* route;

@property (copy, nonatomic)   NSString* startPoint;
@property (copy, nonatomic)   NSString* endPoint;
@property (assign, nonatomic) NSInteger price;

@end
