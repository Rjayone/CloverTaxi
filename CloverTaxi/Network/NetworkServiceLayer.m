//
//  NetworkServiceLayer.m
//  CloverTaxi
//
//  Created by Andrew Medvedev on 3/12/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "NetworkServiceLayer.h"
#import "NetworkTransportLayer.h"
#import "Route.h"
#import "Driver.h"

@interface NetworkServiceLayer ()

@property (strong, nonatomic) NetworkTransportLayer* transportLayer;

@end



@implementation NetworkServiceLayer

//------------------------------------------------------------------------------
+ (instancetype)sharedLayer {
    static NetworkServiceLayer* serviceLayer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        serviceLayer = [[NetworkServiceLayer alloc]init];
    });
    
    return serviceLayer;
}

//------------------------------------------------------------------------------
- (instancetype)init
{
    self = [super init];
    if (self) {
        _transportLayer = [[NetworkTransportLayer alloc]init];
    }
    return self;
}

//------------------------------------------------------------------------------
- (void)driverForRoute:(Route*)route
               success:(SuccessArrayBlock)success
               failure:(FailureBlock)failure {
    
    NSMutableDictionary* params = [route.dictionaryValue mutableCopy];
    [params addEntriesFromDictionary:@{ @"startPos" : @"",
                                        @"endPos" : @"",
                                        @"distance" : @(route.distance),
                                        @"duration" : @(route.duration),
                                        @"format"   : @"json"
                                     }];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self.transportLayer driverWithParams:params
                                  success:^(NSDictionary *items) {
                                      NSMutableArray* drivers = [NSMutableArray array];
                                      for(NSDictionary* item in items[@"drivers"]) {
                                          Driver* driver = [[Driver alloc]initWithDictionary:item];
                                          [drivers addObject:driver];
                                      }
                                      success(drivers);
                                      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                                  } failure:^(NSString *request, NSError *error) {
                                      failure(request, error);
                                      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                                  }];
}

@end


//Google services
@implementation NetworkServiceLayer (GoogleMaps)

//------------------------------------------------------------------------------
- (void)googleMapsDirectionWithRoute:(Route*)route
                             success:(SuccessArrayBlock)success
                             failure:(FailureBlock)failure {

    NSDictionary* params = route.dictionaryValue;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [self.transportLayer
     googleMapsDirectionWithParams:params
     success:^(NSDictionary *items) {
         NSArray* route = [items objectForKey:@"routes"];
         [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
         success(route);
     } failure:^(NSString *request, NSError *error) {
         failure(request, error);
         [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

     }];
}

@end