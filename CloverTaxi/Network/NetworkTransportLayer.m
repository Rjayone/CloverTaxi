//
//  NetworkTransportLayer.m
//  CloverTaxi
//
//  Created by Andrew Medvedev on 3/12/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "NetworkTransportLayer.h"
#import <AFNetworking.h>

@interface NetworkTransportLayer ()
@property (strong, nonatomic) AFHTTPSessionManager* googleManager;
@property (strong, nonatomic) AFHTTPSessionManager* serviceManager;
@end


@implementation NetworkTransportLayer

//------------------------------------------------------------------------------
- (instancetype)init {
    self = [super init];
    if(self != nil) {
        _googleManager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:[Common googleMapsURL]]];
        _serviceManager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:[Common serviceURL]]];
    }
    return self;
}

//------------------------------------------------------------------------------
- (void)driverWithParams:(NSDictionary*)params
                 success:(SuccessDictionaryBlock)success
                 failure:(FailureBlock)failure {
    
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"drivers" ofType:@"json"];
    NSData* jsonString = [NSData dataWithContentsOfFile:path];
    
    NSError* error = nil;
    NSDictionary* drivers = [NSJSONSerialization JSONObjectWithData:jsonString options:0 error:&error];

    NSString* str = [[NSString alloc]initWithData:[NSJSONSerialization dataWithJSONObject:params options:0 error:&error]encoding:NSUTF8StringEncoding];
    success(drivers);
    return;
    
    [self.serviceManager GET:@"driver"
                  parameters:params
                    progress:nil
                     success:^(NSURLSessionDataTask* task, id responseObject) {
                         success(responseObject);
                     } failure:^(NSURLSessionDataTask* task, NSError* error) {
                         failure(task.currentRequest.URL.absoluteString, error);
                     }];
}

//------------------------------------------------------------------------------
- (void)googleMapsDirectionWithParams:(NSDictionary*)params
                              success:(SuccessDictionaryBlock)success
                              failure:(FailureBlock)failure {
    
    [self.googleManager GET:@"directions/json"
           parameters:params
             progress:nil
              success:^(NSURLSessionDataTask* task, id responseObject) {
                  success(responseObject);
              } failure:^(NSURLSessionDataTask* task, NSError* error) {
                  failure(task.currentRequest.URL.absoluteString, error);
              }];
}

@end
