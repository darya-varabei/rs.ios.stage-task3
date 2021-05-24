#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    if (monthNumber < 1 ||  monthNumber > 12){
        return nil;
    }

    NSString *nameString = [[formatter monthSymbols] objectAtIndex:(monthNumber-1)];
    return nameString;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
      NSDate *dateFormat = [dateFormatter dateFromString:date];
    
    [dateFormatter setDateFormat:@"dd"];
    NSString *day = [dateFormatter stringFromDate:dateFormat];
    
    long dayInt = [day longLongValue];
    return dayInt;
    
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSDateFormatter *weekdayFormat = [[NSDateFormatter alloc] init];
    [weekdayFormat setDateFormat: @"EE"];
    weekdayFormat.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    
    return [weekdayFormat stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *gregorianCalendar = [NSCalendar currentCalendar];
    
    NSInteger currentWeek = [gregorianCalendar component:NSCalendarUnitWeekOfYear fromDate:[NSDate now]];
    NSInteger componentWeek = [gregorianCalendar component:NSCalendarUnitWeekOfYear fromDate:date];

        if (currentWeek == componentWeek) {
            return YES;
        }
        
        return NO;
}

@end
