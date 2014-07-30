//
//  ISO8601Serialization.m
//  ISO8601
//
//  Created by Sam Soffes on 7/30/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

#import "ISO8601Serialization.h"

@implementation ISO8601Serialization

+ (NSDate *)dateWithISO8601String:(NSString *)string {
	// Return nil if nil is given
	if (!string || [string isEqual:[NSNull null]]) {
		return nil;
	}
	
	// Parse number
	if ([string isKindOfClass:[NSNumber class]]) {
		return [NSDate dateWithTimeIntervalSince1970:[(NSNumber *)string doubleValue]];
	}
	
	// Parse string
	else if ([string isKindOfClass:[NSString class]]) {
		const char *str = [string cStringUsingEncoding:NSUTF8StringEncoding];
		size_t len = strlen(str);
		if (len == 0) {
			return nil;
		}
		
		struct tm tm;
		char newStr[25] = "";
		BOOL hasTimezone = NO;
		
		// 2014-03-30T09:13:00Z
		if (len == 20 && str[len - 1] == 'Z') {
			strncpy(newStr, str, len - 1);
		}
		
		// 2014-03-30T09:13:00-07:00
		else if (len == 25 && str[22] == ':') {
			strncpy(newStr, str, 19);
			hasTimezone = YES;
		}
		
		// 2014-03-30T09:13:00.000Z
		else if (len == 24 && str[len - 1] == 'Z') {
			strncpy(newStr, str, 19);
		}
		
		// 2014-03-30T09:13:00.000-07:00
		else if (len == 29 && str[26] == ':') {
			strncpy(newStr, str, 19);
			hasTimezone = YES;
		}
		
		// Poorly formatted timezone
		else {
			strncpy(newStr, str, len > 24 ? 24 : len);
		}
		
		// Timezone
		size_t l = strlen(newStr);
		if (hasTimezone) {
			strncpy(newStr + l, str + len - 6, 3);
			strncpy(newStr + l + 3, str + len - 2, 2);
		} else {
			strncpy(newStr + l, "+0000", 5);
		}
		
		// Add null terminator
		newStr[sizeof(newStr) - 1] = 0;
		
		if (strptime(newStr, "%FT%T%z", &tm) == NULL) {
			return nil;
		}
		
		time_t t;
		t = mktime(&tm);
		
		return [NSDate dateWithTimeIntervalSince1970:t];
	}
	
	NSAssert1(NO, @"Failed to parse date: %@", string);
	
	return nil;
}


+ (NSString *)ISO8601StringWithDate:(NSDate *)date {
	struct tm *timeinfo;
	char buffer[80];
	
	time_t rawtime = (time_t)[date timeIntervalSince1970];
	timeinfo = gmtime(&rawtime);
	
	strftime(buffer, 80, "%Y-%m-%dT%H:%M:%SZ", timeinfo);
	
	return [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];
}

@end
