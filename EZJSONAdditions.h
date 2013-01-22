
//  Created by kssX on 5/22/12.

#import <Foundation/Foundation.h>

@interface EZJSONAdditions : NSObject
+ (NSDate *)getDateFromJSON:(NSString *)dateString;
+ (NSString *)dateStringFromNSDate:(NSDate *)date;
@end
