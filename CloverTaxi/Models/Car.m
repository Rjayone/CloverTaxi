//
//  Car.m
//  CloverTaxi
//
//  Created by Andrew Medvedev on 4/2/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "Car.h"

@implementation Car

- (instancetype)initWithDictionary:(NSDictionary*)params {
    self = [super init];
    if(self != nil) {
        _mark = params[@"mark"];
        _model = params[@"model"];
        _number = params[@"number"];
        _color = params[@"color"];
        _imagePath = params[@"imagePath"];
    }
    return self;
}

- (NSString*)formattedCar {
    return [NSString stringWithFormat:@"%@ %@ %@,\n%@", self.color, self.mark, self.model, self.number];
}

@end
