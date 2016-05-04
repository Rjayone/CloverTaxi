//
//  NSDateFormatter+DateConverter.h
//  S7
//
//  Created by Andrew Medvedev on 12/11/15.
//  Copyright © 2015 OnTravelSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (DateConveter)

- (NSString*)convertStringFromResponse:(NSString*)dateString;
- (NSString*)convertStringFromCellToResponse:(NSString*)cellString;
- (NSString*)dateForRequest:(NSDate*)date;

- (NSDate*)dateFromResponse:(NSString*)dateString;
- (NSString*)stringFromDate:(NSDate*)date withFormat:(NSString*)format;

@end
