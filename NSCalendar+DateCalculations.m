//
//  NSCalendar+DateCalculations.m
//  WishGenie
//
//  Created by serk on 3/5/12.
//  Copyright (c) 2012 WishGenie. All rights reserved.
//

#import "NSCalendar+DateCalculations.h"

@implementation NSCalendar (DateCalculations)


- (NSDate *)beginningOfMonth:(NSDate *)date
{
    NSDateComponents *comp = [self components:(NSYearCalendarUnit | NSMonthCalendarUnit) fromDate:date];
    return [self dateFromComponents:comp];
}

- (NSDate *)beginningOfDay:(NSDate *)date
{
    NSDateComponents *comp = [self components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:date];
    return [self dateFromComponents:comp];
}

- (BOOL)isDateOnCurrentDay:(NSDate *)date
{
    NSDateComponents *dateComponents = [self components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:date];
    NSDateComponents *currentDateComponents = [self components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:[NSDate date]];
    
    return [dateComponents isEqual:currentDateComponents];
}

- (BOOL)isDateOnCurrentMonth:(NSDate *)date
{
    NSDateComponents *dateComponents = [self components:(NSYearCalendarUnit | NSMonthCalendarUnit) fromDate:date];
    NSDateComponents *currentDateComponents = [self components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:[NSDate date]];
    
    return [dateComponents isEqual:currentDateComponents];
}

- (BOOL)isDateOnCurrentYear:(NSDate *)date
{
    NSDateComponents *dateComponents = [self components:(NSYearCalendarUnit) fromDate:date];
    NSDateComponents *currentDateComponents = [self components:NSYearCalendarUnit fromDate:[NSDate date]];
    
    return [dateComponents isEqual:currentDateComponents];
}

- (BOOL)localDatesOnTheSameDay:(NSDate *)startDate endDate:(NSDate *)endDate {

    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents* comp1 = [self components:unitFlags fromDate:startDate];
    NSDateComponents* comp2 = [self components:unitFlags fromDate:endDate];
    
    return [comp1 day]   == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];
}


- (NSString *)timeTillDate:(NSDate *)date
{
    NSDateComponents *components;
 
    components = [self components:NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit fromDate:[NSDate date] toDate:date options:0];
    
    NSString *dayDifference = @"";
    if ([components day] > 0) {
       dayDifference = [NSString stringWithFormat:@"%d %@", [components day], [components day] == 1 ? @"day ":@"days "];
    }
    
    NSString *hourDifference = @"";
    if ([components hour] > 0) {
        hourDifference = [NSString stringWithFormat:@"%d %@", [components hour], [components hour] == 1 ? @"hour ":@"hours "];
    }
    
    NSString *minuteDifference = @"";
    if ([components day] == 0 || [components hour] == 0) {
        minuteDifference = [NSString stringWithFormat:@"%d %@", [components minute], [components minute] == 1 ? @"minute ":@"minutes "];
    }
    
    return [NSString stringWithFormat:@"%@%@%@", dayDifference, hourDifference, minuteDifference];
}





@end
