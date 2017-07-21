//
//  NSDate+ISO8601.h
//  ISO8601
//
//  Created by Sam Soffes on 7/30/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

#if __has_feature(modules)
	@import Foundation;
#else
	#import <Foundation/Foundation.h>
#endif

@interface NSDate (ISO8601)

#pragma mark - Simple

/**
 Returns a new date represented by an ISO8601 string.

 @param string An ISO8601 string.

 @return A date represented by the ISO8601 string.
 */
+ (NSDate * __nullable)dateWithISO8601String:(NSString * __nonnull)string;

/**
 Returns a string representation of the receiver in ISO8601 format.

 @return A string representation of the receiver in ISO8601 format in the current calendar's time
         zone.
 */
- (NSString * __nullable)ISO8601String;


#pragma mark - Advanced

/**
 Returns a new date represented by an ISO8601 string as well as the time zone.

 @param string An ISO8601 string.

 @param timeZone Upon return, contains the time zone or `nil` if none was specified.

 @param calendar The calender to use for converting the date to date components. If `nil` is specified, the current
                 calendar is used.

 @return A date represented by the ISO8601 string.
 */
+ (NSDate * __nullable)dateWithISO8601String:(NSString * __nonnull)string timeZone:(inout NSTimeZone * __nonnull * __nullable)timeZone usingCalendar:(NSCalendar * __nullable)calendar;

/**
 Returns a string representation of the receiver in ISO8601 format.

 @param timeZone The time zone to use. If `nil` is specified, UTC will be used.

 @param calendar The calender to use for converting the date to date components. If `nil` is specified, the current
                 calendar is used.

 @return A string representation of the receiver in ISO8601 format in `timeZone`.
 */
- (NSString * __nullable)ISO8601StringWithTimeZone:(NSTimeZone * __nullable)timeZone usingCalendar:(NSCalendar * __nullable)calendar includeMilliSeconds:(BOOL)includeMilliSeconds;

@end
