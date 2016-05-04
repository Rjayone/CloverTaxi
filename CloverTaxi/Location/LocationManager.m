//
//  LocationManager.m
//  Outlay
//
//  Created by Andrew Medvedev on 2/26/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "LocationManager.h"

NSString* const LocationManagerDidChangeAuthorizationStatusNotification = @"kLocationManagerDidChangeAuthorizationStatus";

@interface LocationManager () <CLLocationManagerDelegate>
@property(strong, nonatomic) CLLocationManager *locationManager;
@end


@implementation LocationManager

//------------------------------------------------------------------------------
+ (instancetype)sharedManager {
    static LocationManager* manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LocationManager alloc]init];
    });
    return manager;
}

//------------------------------------------------------------------------------
- (instancetype)init
{
    self = [super init];
    if (self != nil) {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest; // 100 m
        _locationManager.delegate = self;
        _locationManager.pausesLocationUpdatesAutomatically = YES;

        [_locationManager requestWhenInUseAuthorization];
        [_locationManager startUpdatingLocation];
    }
    return self;
}

//------------------------------------------------------------------------------
- (CLLocationCoordinate2D)currentLocation {
    return _locationManager.location.coordinate;
}

//------------------------------------------------------------------------------
- (CLLocationDistance)deltaDistanceTo:(nullable CLLocation*)loc {
    if(!loc)
        loc = [self lastStoredLocation];
    
    return [_locationManager.location distanceFromLocation:loc];
}


#pragma mark - CLLocationManagerDelegate

//------------------------------------------------------------------------------
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    
}

//------------------------------------------------------------------------------
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
}

//------------------------------------------------------------------------------
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
}

//------------------------------------------------------------------------------
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    [[NSNotificationCenter defaultCenter]postNotificationName:LocationManagerDidChangeAuthorizationStatusNotification object:@(status)];
}


#pragma mark - Location Usage

//------------------------------------------------------------------------------
- (void)startUpdatingLocation {
    [self.locationManager startUpdatingLocation];
}

//------------------------------------------------------------------------------
- (void)stopUpdatingLocation {
    [self.locationManager stopUpdatingLocation];
}


#pragma mark - Save/Load Actions

//------------------------------------------------------------------------------
- (void)storeLocation {
    [self startUpdatingLocation];
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@(self.currentLocation.longitude) forKey:@"lastLon"];
    [defaults setObject:@(self.currentLocation.latitude) forKey:@"lastLat"];
    [defaults synchronize];
    [self stopUpdatingLocation];
    
    NSLog(@"Store Location:%@", self.locationManager.location);
}

//------------------------------------------------------------------------------
- (CLLocation*)lastStoredLocation {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake([[defaults objectForKey:@"lastLat"]floatValue], [[defaults objectForKey:@"lastLon"]floatValue]);
    CLLocation* lastLocation = [[CLLocation alloc]initWithLatitude:coord.latitude longitude:coord.longitude];
    NSLog(@"Last Restored Location:%@", lastLocation);
    return lastLocation;
}

@end
