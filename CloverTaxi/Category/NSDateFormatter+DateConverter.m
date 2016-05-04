//
//  NSDateFormatter+DateConverter.m
//  S7
//
//  Created by Andrew Medvedev on 12/11/15.
//  Copyright © 2015 OnTravelSolutions. All rights reserved.
//

#import "NSDateFormatter+DateConverter.h"

@implementation NSDateFormatter (DateConverter)

//------------------------------------------------------------------------------
- (NSString*)convertStringFromResponse:(NSString*)dateString {
    //yyyy-MM-dd
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd";
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    NSDate* date = [formatter dateFromString:dateString];
    formatter.dateFormat = @"dd-MM-yyyy";
    
    NSString* outputString = [[formatter stringFromDate:date]stringByReplacingOccurrencesOfString:@"-" withString:@"."];
    return outputString ? : @"";
}

//------------------------------------------------------------------------------
- (NSString*)convertStringFromCellToResponse:(NSString*)cellString {
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"dd.MM.yyyy";
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    NSDate* date = [formatter dateFromString:cellString];
    formatter.dateFormat = @"yyyy-MM-dd";
    
    NSString* outputString = [[formatter stringFromDate:date]stringByReplacingOccurrencesOfString:@"." withString:@"-"];
    return outputString ? : @"";
}

//------------------------------------------------------------------------------
- (NSString*)dateForRequest:(NSDate*)date {
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    formatter.dateFormat = @"yyyyMMdd";
    return [formatter stringFromDate:date];
}

//------------------------------------------------------------------------------
- (NSDate*)dateFromResponse:(NSString*)dateString {
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd";
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    NSDate* date = [formatter dateFromString:dateString];
    
    return date;
}

//------------------------------------------------------------------------------
- (NSString*)stringFromDate:(NSDate*)date withFormat:(NSString*)format {
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = format;
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    NSString* dateString = [formatter stringFromDate:date];
    
    return dateString;
}
@end
