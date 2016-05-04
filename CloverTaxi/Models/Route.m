//
//  Route.m
//  CloverTaxi
//
//  Created by Andrew Medvedev on 3/19/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "Route.h"

@implementation Route

- (instancetype)initWithOrigin:(CLLocationCoordinate2D)origin andDestination:(CLLocationCoordinate2D)destination {
    self = [super init];
    if(self != nil) {
        _origin = origin;
        _destination = destination;
        _mode = @"driving";
    }
    return self;
}

//------------------------------------------------------------------------------
- (NSDictionary*)dictionaryValue {
    NSString* sOrigin = [NSString stringWithFormat:@"%.4f,%.4f", self.origin.latitude, self.origin.longitude];
    NSString* sDestination = [NSString stringWithFormat:@"%.4f,%.4f", self.destination.latitude, self.destination.longitude];
    return @{@"origin" : sOrigin,
             @"destination" : sDestination,
             @"mode" : self.mode,
             @"language" : [Common language],
             @"key" : [Common googleMapsAPIKey]
             };
}

@end
