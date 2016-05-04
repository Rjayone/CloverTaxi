//
//  NSDate+Utils.h
//  S7
//
//  Created by Andrew Medvedev on 11/17/15.
//  Copyright © 2015 OnTravelSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utils)

+ (NSInteger)dayAmmountFromDate:(NSDate*)from tillDate:(NSDate*)till;
+ (NSDate*)dateWithoutTime:(NSDate*)date;

+ (NSDate*)firstDateOfWeekForDate:(NSDate*)date;
+ (NSDate*)lastDateOfWeekForDate:(NSDate*)date;

+ (NSDate*)firstDateOfMonthForDate:(NSDate*)date;
+ (NSDate*)lastDateOfMonthForDate:(NSDate *)date;

- (NSInteger)numberOfDaysInMonthCount;
+ (NSInteger)currentHour;

@end
