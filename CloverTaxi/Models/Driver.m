//
//  Driver.m
//  CloverTaxi
//
//  Created by Andrew Medvedev on 4/2/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "Driver.h"
#import "Car.h"

@implementation Driver

- (instancetype)initWithDictionary:(NSDictionary*)params {
    self = [super init];
    if(self != nil) {
        _Id = params[@"id"];
        _firstName = params[@"firstName"];
        _lastName = params[@"lastName"];
        _imagePath = params[@"imagePath"];
        _car = [[Car alloc]initWithDictionary:params[@"car"]];
    }
    return self;
}

- (NSString*)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
