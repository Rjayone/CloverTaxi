//
//  Route.h
//  CloverTaxi
//
//  Created by Andrew Medvedev on 3/19/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkServiceLayer.h"

@interface Route : NSObject <NetworkableStateProtocol>

@property (assign, nonatomic) CLLocationCoordinate2D origin;
@property (assign, nonatomic) CLLocationCoordinate2D destination;
@property (copy, nonatomic) NSString* mode;

@property (assign, nonatomic) NSInteger distance;
@property (assign, nonatomic) NSInteger duration;

- (instancetype)initWithOrigin:(CLLocationCoordinate2D)origin andDestination:(CLLocationCoordinate2D)destination;

@end
