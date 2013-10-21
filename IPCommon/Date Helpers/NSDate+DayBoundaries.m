//
//  Created by Mark Daigneault on 5/13/13.
//  Copyright (c) 2013 Intrepid Pursuits. All rights reserved.
//

#import "NSDate+DayBoundaries.h"

#define SecondsInHour 60*60

@implementation NSDate (DayBoundaries)

+ (NSDate *)startDateForCurrentWeek {
    NSDate *currentDate = [NSDate date];
    return [currentDate startOfWeek];
}

- (NSDate *)startOfWeek {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *currentDateWeekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
    NSDateComponents *dateComponentsToSubtract = [[NSDateComponents alloc] init];
    dateComponentsToSubtract.day = calendar.firstWeekday - currentDateWeekdayComponents.weekday;
    NSDate *startDate = [calendar dateByAddingComponents:dateComponentsToSubtract toDate:self options:0];
    NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:startDate];
    return [calendar dateFromComponents:components];
}

- (NSDate *)startOfMonth {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:
                                    (NSYearCalendarUnit |
                                     NSMonthCalendarUnit |
                                     NSDayCalendarUnit)
                                               fromDate:self];
    
    NSDate *startDate = [calendar dateFromComponents:components];
    return startDate;
}

- (NSDate *)endOfWeek {
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    componentsToAdd.week = 1;
    componentsToAdd.second = -1;
    return [[NSCalendar currentCalendar] dateByAddingComponents:componentsToAdd toDate:[self startOfWeek] options:0];
}


- (NSDate *)beginningOfDay
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:self];
    
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    
    return [cal dateFromComponents:components];
}

- (NSTimeInterval)timeIntervalSinceStartOfDay {
    return [self timeIntervalSinceDate:[self beginningOfDay]];
}

+ (NSArray *)hoursInADay
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"ha"];
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[NSDate date]];
    
    NSMutableArray *hoursInADay = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 24; i ++)
    {
        if (i == 0 || i == 12 || i == 23)
        {
            components.hour = i;
            [hoursInADay addObject:[formatter stringFromDate:[cal dateFromComponents:components]]];
        }
        else
        {
            int hour = i;
            if (hour > 12) hour -= 12;
            [hoursInADay addObject:[NSString stringWithFormat:@"%d", hour]];
        }
        
    }
    return hoursInADay;
}

- (NSDate *)dateBySubstractingDay {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = -1;
    return [calendar dateByAddingComponents:components toDate:self options:0];
}
- (NSDate *)dateBySubstractingWeek {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.week = -1;
    return [calendar dateByAddingComponents:components toDate:self options:0];
}
- (NSDate *)dateBySubstractingMonth {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = -1;
    return [calendar dateByAddingComponents:components toDate:self options:0];
    
}
- (NSDate *)dateBySubstractingYear {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = -1;
    return [calendar dateByAddingComponents:components toDate:self options:0];
}
- (NSDate *)dateByAddingDay {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = 1;
    return [calendar dateByAddingComponents:components toDate:self options:0];
}
- (NSDate *)dateByAddingWeek {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.week = 1;
    return [calendar dateByAddingComponents:components toDate:self options:0];
    
}

- (NSDate *)dateByAddingMonth {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = 1;
    return [calendar dateByAddingComponents:components toDate:self options:0];
    
}

- (NSDate *)dateByAddingYear {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = 1;
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateAtHour:(NSInteger)hour {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:( NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:self];
    
    [components setHour:hour];
    [components setMinute:0];
    [components setSecond:0];
    return [calendar dateFromComponents:components];
    
    
}

@end
