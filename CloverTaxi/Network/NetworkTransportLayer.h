//
//  NetworkTransportLayer.h
//  CloverTaxi
//
//  Created by Andrew Medvedev on 3/12/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkTransportLayer : NSObject

- (void)driverWithParams:(NSDictionary*)params
                 success:(SuccessDictionaryBlock)success
                 failure:(FailureBlock)failure;

@end


@interface NetworkTransportLayer (GoogleMaps)

- (void)googleMapsDirectionWithParams:(NSDictionary*)params
                              success:(SuccessDictionaryBlock)success
                              failure:(FailureBlock)failure;

@end