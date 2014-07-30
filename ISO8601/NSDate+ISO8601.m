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

+ (NSDate *)dateWithISO8601String:(NSString *)string {
	return [ISO8601Serialization dateWithISO8601String:string];
}


- (NSString *)ISO8601String {
	return [ISO8601Serialization ISO8601StringWithDate:self];
}

@end
