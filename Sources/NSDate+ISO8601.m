//
//  NSDate+ISO8601.m
//  ISO8601
//
//  Created by Sam Soffes on 7/30/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

#import "NSDate+ISO8601.h"
#import "ISO8601Serialization.h"

static NSCalendar *ISO8601Calendar(NSTimeZone *__nullable timeZone){
	static dispatch_once_t onceToken;
	static NSCache *cache;
	dispatch_once(&onceToken, ^{
		cache = [NSCache new];
	});

	id key = @(timeZone.secondsFromGMT);
	NSCalendar *calendar = [cache objectForKey:key];
	if (!calendar) {
		calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
		calendar.timeZone = timeZone ? (NSTimeZone *__nonnull)timeZone : [NSTimeZone timeZoneForSecondsFromGMT:0];
		[cache setObject:calendar forKey:@(timeZone.secondsFromGMT)];
	}

	return calendar;
}

@implementation NSDate (ISO8601)

#pragma mark - Reading

+ (NSDate * __nullable)dateWithISO8601String:(NSString *)string {
	return [self dateWithISO8601String:string timeZone:nil usingCalendar:nil];
}


+ (NSDate * __nullable)dateWithISO8601String:(NSString * __nonnull)string timeZone:(inout NSTimeZone * __nonnull * __nullable)timeZonePtr usingCalendar:(NSCalendar * __nullable)calendar {
	NSDateComponents *components = [ISO8601Serialization dateComponentsForString:string];
	if (components == nil) {
		return nil;
	}

	NSTimeZone *timeZone = components.timeZone ? components.timeZone : [NSTimeZone timeZoneForSecondsFromGMT:0];
	if (timeZonePtr) {
		*timeZonePtr = timeZone;
	}

	if (!calendar) {
		calendar = ISO8601Calendar(timeZone);
	} else {
		calendar.timeZone = timeZone;
	}

	return [calendar dateFromComponents:components];
}


#pragma mark - Writing

- (NSString * __nullable)ISO8601String {
	return [self ISO8601StringWithTimeZone:[NSTimeZone localTimeZone] usingCalendar:nil];
}

- (NSString * __nullable)ISO8601StringWithTimeZone:(NSTimeZone * __nullable)timeZone usingCalendar:(NSCalendar * __nullable)calendar includeMicroseconds:(BOOL)includeMicroseconds {
	if (!calendar) {
		calendar = ISO8601Calendar(timeZone);
	}

	NSCalendarUnit units = (NSCalendarUnit)(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour |
		NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitTimeZone);
	if (includeMicroseconds) {
		units |= NSCalendarUnitNanosecond;
	}

	NSDateComponents *dateComponents = [calendar components:units fromDate:self];
	return [ISO8601Serialization stringForDateComponents:dateComponents];
}

- (NSString * __nullable)ISO8601StringWithTimeZone:(NSTimeZone * __nullable)timeZone usingCalendar:(NSCalendar * __nullable)calendar {
	return [self ISO8601StringWithTimeZone:timeZone usingCalendar:calendar includeMicroseconds:NO];
}

@end
