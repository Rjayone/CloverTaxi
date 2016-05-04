//
//  NetworkServiceLayer.h
//  CloverTaxi
//
//  Created by Andrew Medvedev on 3/12/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class Route;

//------------------------------------------------------------------------------
@interface NetworkServiceLayer : NSObject

+ (instancetype)sharedLayer;

- (void)driverForRoute:(Route*)route
               success:(SuccessArrayBlock)success
               failure:(FailureBlock)failure;

@end


//------------------------------------------------------------------------------
@interface NetworkServiceLayer (GoogleMaps)

- (void)googleMapsDirectionWithRoute:(Route*)route
                              success:(SuccessArrayBlock)success
                              failure:(FailureBlock)failure;


@end


//------------------------------------------------------------------------------
@protocol NetworkableStateProtocol <NSObject>
@required

- (NSDictionary*)dictionaryValue;

@end