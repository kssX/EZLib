//  Created by kssX on 5/22/12.

#import "EZJSONAdditions.h"

@implementation EZJSONAdditions

+ (NSDate *)getDateFromJSON:(NSString *)dateString
{
    if ([dateString isKindOfClass:[NSNull class]]) {
        return nil;
    }

    NSDate *date;
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    date = [dateFormatter dateFromString:dateString];
    
    return date;
    
}

+ (NSString *)dateStringFromNSDate:(NSDate *)date
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    return [dateFormatter stringFromDate:date];
}



@end
