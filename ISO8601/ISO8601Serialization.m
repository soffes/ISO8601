//
//  ISO8601Serialization.m
//  ISO8601
//
//  Created by Sam Soffes on 7/30/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

#import "ISO8601Serialization.h"

@implementation ISO8601Serialization

+ (NSDateComponents *)dateComponentsForString:(NSString *)string {
	NSScanner *scanner = [[NSScanner alloc] initWithString:string];
	scanner.charactersToBeSkipped = nil;
	
	NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
	
	// Year
	NSInteger year;
	if (![scanner scanInteger:&year]) {
		return nil;
	}
	dateComponents.year = year;
	
	// Month
	if (![scanner scanString:@"-" intoString:nil]) {
		return dateComponents;
	}
	
	NSInteger month;
	if (![scanner scanInteger:&month]) {
		return dateComponents;
	}
	dateComponents.month = month;
	
	// Day
	if (![scanner scanString:@"-" intoString:nil]) {
		return dateComponents;
	}
	
	NSInteger day;
	if (![scanner scanInteger:&day]) {
		return dateComponents;
	}
	dateComponents.day = day;
	
	// Time
	if (![scanner scanCharactersFromSet:[NSCharacterSet characterSetWithCharactersInString:@"T "] intoString:nil]) {
		return dateComponents;
	}
	
	// Hour
	NSInteger hour;
	if (![scanner scanInteger:&hour]) {
		return dateComponents;
	}
	dateComponents.hour = hour;
	
	// Minute
	if (![scanner scanString:@":" intoString:nil]) {
		return dateComponents;
	}
	
	NSInteger minute;
	if (![scanner scanInteger:&minute]) {
		return dateComponents;
	}
	dateComponents.minute = minute;
	
	// Second
	if (![scanner scanString:@":" intoString:nil]) {
		return dateComponents;
	}
	
	NSInteger second;
	if (![scanner scanInteger:&second]) {
		return dateComponents;
	}
	dateComponents.second = second;
	
	// Time zone
	NSUInteger scannerLocation = scanner.scanLocation;
	
	// UTC
	[scanner scanUpToString:@"Z" intoString:nil];
	if ([scanner scanString:@"Z" intoString:nil]) {
		return dateComponents;
	}
	
	// Move back to end of seconds
	scanner.scanLocation = scannerLocation;
	
	// Look for offset
	NSCharacterSet *signs = [NSCharacterSet characterSetWithCharactersInString:@"+-"];
	[scanner scanUpToCharactersFromSet:signs intoString:nil];
	NSString *sign;
	if (![scanner scanCharactersFromSet:signs intoString:&sign]) {
		return dateComponents;
	}
	
	// Offset hour
	NSInteger timeZoneOffset = 0;
	NSInteger timeZoneOffsetHour;
	if (![scanner scanInteger:&timeZoneOffsetHour]) {
		return dateComponents;
	}
	timeZoneOffset = timeZoneOffsetHour * 3600 * ([sign isEqualToString:@"-"] ? -1 : 1);
	dateComponents.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:timeZoneOffset];
	
	// Offset minute
	if (![scanner scanString:@":" intoString:nil]) {
		return dateComponents;
	}
	
	NSInteger timeZoneOffsetMinute;
	if (![scanner scanInteger:&timeZoneOffsetMinute]) {
		return dateComponents;
	}
	
	timeZoneOffset += timeZoneOffsetMinute * 60 * ([sign isEqualToString:@"-"] ? -1 : 1);
	dateComponents.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:timeZoneOffset];
	
	return dateComponents;
}


+ (NSString *)stringForDateComponents:(NSDateComponents *)components {	
	NSString *string = [[NSString alloc] initWithFormat:@"%04li-%02i-%02iT%02i:%02i:%02i", (long)components.year,
						(int)components.month, (int)components.day, (int)components.hour, (int)components.minute,
						(int)components.second];
	
	NSTimeZone *timeZone = components.timeZone;
	if (timeZone.secondsFromGMT != 0) {
		NSInteger hoursOffset = timeZone.secondsFromGMT / 3600;
		
		// TODO: Assuming whole hour offsets at the moment
		NSUInteger secondsOffset = 0;
		
		NSString *sign = (hoursOffset >= 0) ? @"+" : @"-";
		return [string stringByAppendingFormat:@"%@%02i:%02i", sign, abs((int)hoursOffset), (int)secondsOffset];
	}
	
	return [string stringByAppendingString:@"Z"];
}

@end
