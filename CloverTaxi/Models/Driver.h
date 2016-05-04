//
//  Driver.h
//  CloverTaxi
//
//  Created by Andrew Medvedev on 4/2/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Car;

@interface Driver : NSObject

@property (copy, nonatomic) NSString* Id;
@property (copy, nonatomic) NSString* firstName;
@property (copy, nonatomic) NSString* lastName;
@property (copy, nonatomic) NSString* imagePath;
@property (strong, nonatomic) Car* car;

- (instancetype)initWithDictionary:(NSDictionary*)params;
- (NSString*)fullName;

@end
