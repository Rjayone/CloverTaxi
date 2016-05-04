//
//  NSDate+Utils.m
//  S7
//
//  Created by Andrew Medvedev on 11/17/15.
//  Copyright © 2015 OnTravelSolutions. All rights reserved.
//

#import "NSDate+Utils.h"

@implementation NSDate(Utils)

//------------------------------------------------------------------------------
+ (NSInteger)dayAmmountFromDate:(NSDate*)from tillDate:(NSDate*)till {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    [calendar setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    NSDateComponents *comps = [calendar components: NSCalendarUnitDay
                                           fromDate: from
                                             toDate: till
                                            options: 0];
    return [comps day];
}

//------------------------------------------------------------------------------
+ (NSDate*)dateWithoutTime:(NSDate*)date {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    [calendar setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    NSInteger comps = (NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitMonth);
    NSDateComponents *dateComponents = [calendar components:comps fromDate: date];
    return [calendar dateFromComponents:dateComponents];
}


//------------------------------------------------------------------------------
+ (NSDate*)firstDateOfWeekForDate:(NSDate*)date {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    calendar.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    
    NSUInteger flag = NSCalendarUnitYear + NSCalendarUnitMonth + NSCalendarUnitDay + NSCalendarUnitWeekday;
    NSDateComponents* comps = [calendar components:flag fromDate:[NSDate dateWithoutTime:date]];
//    NSLog(@"%@", [NSDate dateWithoutTime:date]);
    
    NSInteger offset = 0;
    if(comps.weekday - 2 > 0)
        offset = comps.weekday - 2;
    else if (comps.weekday - 2 == 0)
        offset = 0;
    else offset = 6;
    
    comps.day -= offset;//(comps.weekday - 2 > 0) ? ((comps.weekday - 2 == 0) ? 1 : 1)  : 6;
    
//    NSLog(@"%@", [calendar dateFromComponents:comps]);
    return [calendar dateFromComponents:comps];
}

//------------------------------------------------------------------------------
+ (NSDate*)lastDateOfWeekForDate:(NSDate*)date {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    calendar.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    
    NSUInteger flag = NSCalendarUnitYear + NSCalendarUnitMonth + NSCalendarUnitDay + NSCalendarUnitWeekday + NSCalendarUnitHour + NSCalendarUnitMinute;
    NSDateComponents* comps = [calendar components:flag fromDate:[self firstDateOfWeekForDate:date]];
    comps.day += 6;
    comps.hour = 23;
    comps.minute = 59;
    
    return [calendar dateFromComponents:comps];
}

//------------------------------------------------------------------------------
+ (NSDate*)firstDateOfMonthForDate:(NSDate *)date {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    calendar.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    NSUInteger flag = NSCalendarUnitYear + NSCalendarUnitMonth + NSCalendarUnitDay + NSCalendarUnitWeekday;
    NSDateComponents* comps = [calendar components:flag fromDate:date];//[self firstDateOfWeekForDate:date]];
    comps.day = 1;
    
    return [calendar dateFromComponents:comps];
    
}

//------------------------------------------------------------------------------
+ (NSDate*)lastDateOfMonthForDate:(NSDate *)date {
    NSInteger dayCount = [date numberOfDaysInMonthCount];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    calendar.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    NSDateComponents *comp = [calendar components:
                              NSCalendarUnitYear |
                              NSCalendarUnitMonth|
                              NSCalendarUnitDay  |
                              NSCalendarUnitHour |
                              NSCalendarUnitMinute
                                         fromDate:date];
    
    comp.day = dayCount;
    comp.hour = 23;
    comp.minute = 59;
    
    return [calendar dateFromComponents:comp];
}

//------------------------------------------------------------------------------
- (NSInteger)numberOfDaysInMonthCount {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    calendar.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    NSRange dayRange = [calendar rangeOfUnit:NSCalendarUnitDay
                                      inUnit:NSCalendarUnitMonth
                                     forDate:self];
    
    return dayRange.length;
}

//------------------------------------------------------------------------------
+ (NSInteger)currentHour {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    calendar.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    NSDateComponents* comps = [calendar components:NSCalendarUnitHour fromDate:LOCAL_CURRENT_DATE];
    return comps.hour;
}

@end
