//
//  NSCalendar+DateCalculations.h
//  WishGenie
//
//  Created by serk on 3/5/12.
//  Copyright (c) 2012 WishGenie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCalendar (DateCalculations)

- (NSDate *)beginningOfMonth:(NSDate *)date;
- (NSDate *)beginningOfDay:(NSDate *)date;
- (BOOL)isDateOnCurrentDay:(NSDate *)date;
- (BOOL)isDateOnCurrentMonth:(NSDate *)date;
- (BOOL)isDateOnCurrentYear:(NSDate *)date;

- (BOOL)localDatesOnTheSameDay:(NSDate *)startDate endDate:(NSDate *)endDate; 
@end
