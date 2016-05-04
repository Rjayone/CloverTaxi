//
//  LocationManager.h
//  Outlay
//
//  Created by Andrew Medvedev on 2/26/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

extern NSString* const LocationManagerDidChangeAuthorizationStatusNotification;

@interface LocationManager : NSObject

+ (instancetype)sharedManager;

- (CLLocationCoordinate2D)currentLocation;

- (CLLocationDistance)deltaDistanceTo:(nullable CLLocation*)loc;

- (void)startUpdatingLocation;
- (void)stopUpdatingLocation;

- (void)storeLocation;
- (nullable CLLocation*)lastStoredLocation;

@end
