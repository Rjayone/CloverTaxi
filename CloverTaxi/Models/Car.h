//
//  Car.h
//  CloverTaxi
//
//  Created by Andrew Medvedev on 4/2/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (copy, nonatomic) NSString* mark;
@property (copy, nonatomic) NSString* model;
@property (copy, nonatomic) NSString* number;
@property (copy, nonatomic) NSString* color;
@property (copy, nonatomic) NSString* imagePath;

- (instancetype)initWithDictionary:(NSDictionary*)params;
- (NSString*)formattedCar;

@end
