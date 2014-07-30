//
//  ISO8601Serialization.h
//  ISO8601
//
//  Created by Sam Soffes on 7/30/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

@import Foundation;

@interface ISO8601Serialization : NSObject

+ (NSString *)ISO8601StringWithDate:(NSDate *)date;
+ (NSDate *)dateWithISO8601String:(NSString *)string;

@end
