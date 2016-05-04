//
//  Common.m
//  Outlay
//
//  Created by Andrew Medvedev on 2/19/16.
//  Copyright © 2016 Andrew Medvedev. All rights reserved.
//

#import "Common.h"

@implementation Common

//------------------------------------------------------------------------------
+ (NSString*)googleMapsAPIKey {
    return @"AIzaSyCDHFkXEO7eSr5D2EoWK9Qa3Q0nB7IbAbQ";
}

//------------------------------------------------------------------------------
+ (NSString*)googleMapsURL {
    return @"https://maps.googleapis.com/maps/api/";
}

//------------------------------------------------------------------------------
+ (NSString*)serviceURL {
    return @"/service/TaxiDataService.svc/";
}

//------------------------------------------------------------------------------
+ (NSCache*)imageCache {
    static dispatch_once_t onceToken;
    static NSCache* cache;
    dispatch_once(&onceToken, ^{
        cache = [[NSCache alloc]init];
    });
    
    return cache;
}

//------------------------------------------------------------------------------
+ (NSNumberFormatter*)currencyFormatter {
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc]init];
    numberFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
    numberFormatter.locale = [NSLocale currentLocale];
    numberFormatter.maximumFractionDigits = 0;
    return numberFormatter;
}

//------------------------------------------------------------------------------
+ (NSString*)dateString:(NSDate*)date {
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterShortStyle;
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    return [formatter stringFromDate:date];
}

//------------------------------------------------------------------------------
+ (NSString*)language {
    return [[NSLocale currentLocale].localeIdentifier substringToIndex:2];
}

@end

