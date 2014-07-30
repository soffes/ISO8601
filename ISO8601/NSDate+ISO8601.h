//
//  NSDate+ISO8601.h
//  ISO8601
//
//  Created by Sam Soffes on 7/30/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

@import Foundation;

@interface NSDate (ISO8601)

/**
 Returns a new date represented by an ISO8601 string.
 
 @param string An ISO8601 string.
 
 @return Date represented by the ISO8601 string
 */
+ (NSDate *)dateWithISO8601String:(NSString *)string;

/**
 Returns a string representation of the receiver in ISO8601 format.
 
 @return A string representation of the receiver in ISO8601 format.
 */
- (NSString *)ISO8601String;

@end
