//
//  NSDate+ISO8601.m
//  ISO8601
//
//  Created by Sam Soffes on 7/30/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

#import "NSDate+ISO8601.h"
#import "ISO8601Serialization.h"

@implementation NSDate (ISO8601)

#pragma mark - Reading

+ (NSDate *)dateWithISO8601String:(NSString *)string {
	return [self dateWithISO8601String:string timeZone:nil usingCalendar:nil];
}


+ (NSDate *)dateWithISO8601String:(NSString *)string timeZone:(inout NSTimeZone **)timeZone usingCalendar:(NSCalendar *)calendar {
	NSDateComponents *components = [ISO8601Serialization dateComponentsForString:string];
	
	if (!calendar) {
		calendar = [NSCalendar currentCalendar];
	}
	
	*timeZone = components.timeZone;
	
	return [calendar dateFromComponents:components];
}


#pragma mark - Writing

- (NSString *)ISO8601String {
	return [self ISO8601StringWithTimeZone:nil usingCalendar:nil];
}


- (NSString *)ISO8601StringWithTimeZone:(NSTimeZone *)timeZone usingCalendar:(NSCalendar *)calendar {
	if (!calendar) {
		calendar = [NSCalendar currentCalendar];
	}
	
	NSCalendarUnit units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour |
		NSCalendarUnitMinute | NSCalendarUnitSecond;
	
	NSDateComponents *dateComponents = [calendar components:units fromDate:self];
	dateComponents.timeZone = timeZone;
	
	return [ISO8601Serialization stringForDateComponents:dateComponents];
}

@end
