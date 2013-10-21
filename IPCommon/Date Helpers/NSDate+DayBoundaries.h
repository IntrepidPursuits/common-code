//
//  Created by Mark Daigneault on 5/13/13.
//  Copyright (c) 2013 Intrepid Pursuits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DayBoundaries)

+ (NSDate *)startDateForCurrentWeek;
- (NSDate *)startOfMonth;
- (NSDate *)startOfWeek;
- (NSDate *)endOfWeek;

- (NSDate *)beginningOfDay;
- (NSTimeInterval)timeIntervalSinceStartOfDay;

+ (NSArray *)hoursInADay;

- (NSDate *)dateBySubstractingDay;
- (NSDate *)dateBySubstractingWeek;
- (NSDate *)dateBySubstractingMonth;
- (NSDate *)dateBySubstractingYear;
- (NSDate *)dateByAddingDay;
- (NSDate *)dateByAddingWeek;
- (NSDate *)dateByAddingMonth;
- (NSDate *)dateByAddingYear;
- (NSDate *)dateAtHour:(NSInteger)hour;

@end
