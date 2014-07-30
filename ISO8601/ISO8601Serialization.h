//
//  ISO8601Serialization.h
//  ISO8601
//
//  Created by Sam Soffes on 7/30/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

@import Foundation;

@interface ISO8601Serialization : NSObject

#pragma mark - Reading

+ (NSDateComponents *)dateComponentsForString:(NSString *)string;


#pragma mark - Writing

+ (NSString *)stringForDateComponents:(NSDateComponents *)components;

@end
