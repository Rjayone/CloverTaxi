//
//  Common.h
//  Outlay
//
//  Created by Andrew Medvedev on 2/19/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessArrayBlock)(NSArray* items);
typedef void(^SuccessDictionaryBlock)(NSDictionary* items);
typedef void(^FailureBlock)(NSString* request, NSError* error);

static float tarif = 4.5;

@interface Common : NSObject

+ (NSString*)googleMapsAPIKey;
+ (NSString*)googleMapsURL;
+ (NSString*)serviceURL;

+ (NSCache*)imageCache;
+ (NSNumberFormatter*)currencyFormatter;
+ (NSString*)dateString:(NSDate*)date;
+ (NSString*)language;

@end
