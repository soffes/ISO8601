//
//  ISO8601Tests.m
//  ISO8601Tests
//
//  Created by Sam Soffes on 7/30/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

@import Foundation;
@import XCTest;

#import <ISO8601/ISO8601.h>

@interface ISO8601Tests : XCTestCase
@end

@implementation ISO8601Tests

- (void)testDateFromISO8601String {
	NSDate *date = [NSDate dateWithTimeIntervalSince1970:1296502956];
	NSString *string = @"2011-01-31T19:42:36Z";
	XCTAssertEqualObjects(date, [NSDate dateWithISO8601String:string], @"");
	
	date = [NSDate dateWithTimeIntervalSince1970:1323818220];
	string = @"2011-12-13T17:17:00-06:00";
	XCTAssertEqualObjects(date, [NSDate dateWithISO8601String:string], @"");
	
	date = [NSDate dateWithTimeIntervalSince1970:1372347572];
	string = @"2013-06-27T15:39:32.508Z";
	XCTAssertEqualObjects(date, [NSDate dateWithISO8601String:string], @"");
	
	date = [NSDate dateWithTimeIntervalSince1970:1395198000];
	string = @"2014-03-18T20:00:00.000-07:00";
	XCTAssertEqualObjects(date, [NSDate dateWithISO8601String:string], @"");
}


- (void)testISO8601String {
	NSDate *date = [NSDate dateWithTimeIntervalSince1970:1296502956];
	NSString *string = @"2011-01-31T19:42:36Z";
	XCTAssertEqualObjects(string, [date ISO8601String], @"");
	
	date = [NSDate dateWithTimeIntervalSince1970:1336467079];
	string = @"2012-05-08T08:51:19Z";
	XCTAssertEqualObjects(string, [date ISO8601String], @"");
}

@end

/*
 [['1999-05-23 23:55:21',false],[1999,5,23,23,55,21,nil,nil,nil], __LINE__],
 [['1999-05-23 23:55:21+0900',false],[1999,5,23,23,55,21,'+0900',9*3600,nil], __LINE__],
 [['1999-05-23 23:55:21-0900',false],[1999,5,23,23,55,21,'-0900',-9*3600,nil], __LINE__],
 [['1999-05-23 23:55:21+09:00',false],[1999,5,23,23,55,21,'+09:00',9*3600,nil], __LINE__],
 [['1999-05-23T23:55:21-09:00',false],[1999,5,23,23,55,21,'-09:00',-9*3600,nil], __LINE__],
 [['1999-05-23 23:55:21Z',false],[1999,5,23,23,55,21,'Z',0,nil], __LINE__],
 [['1999-05-23T23:55:21Z',false],[1999,5,23,23,55,21,'Z',0,nil], __LINE__],
 [['-1999-05-23T23:55:21Z',false],[-1999,5,23,23,55,21,'Z',0,nil], __LINE__],
 [['-1999-05-23T23:55:21Z',true],[-1999,5,23,23,55,21,'Z',0,nil], __LINE__],
 [['19990523T23:55:21Z',false],[1999,5,23,23,55,21,'Z',0,nil], __LINE__],
 
 [['+011985-04-12',false],[11985,4,12,nil,nil,nil,nil,nil,nil], __LINE__],
 [['+011985-04-12T10:15:30',false],[11985,4,12,10,15,30,nil,nil,nil], __LINE__],
 [['-011985-04-12',false],[-11985,4,12,nil,nil,nil,nil,nil,nil], __LINE__],
 [['-011985-04-12T10:15:30',false],[-11985,4,12,10,15,30,nil,nil,nil], __LINE__],
 
 [['02-04-12',false],[2,4,12,nil,nil,nil,nil,nil,nil], __LINE__],
 [['02-04-12',true],[2002,4,12,nil,nil,nil,nil,nil,nil], __LINE__],
 [['0002-04-12',false],[2,4,12,nil,nil,nil,nil,nil,nil], __LINE__],
 [['0002-04-12',true],[2,4,12,nil,nil,nil,nil,nil,nil], __LINE__],
 
 [['19990523',true],[1999,5,23,nil,nil,nil,nil,nil,nil], __LINE__],
 [['-19990523',true],[-1999,5,23,nil,nil,nil,nil,nil,nil], __LINE__],
 [['990523',true],[1999,5,23,nil,nil,nil,nil,nil,nil], __LINE__],
 [['0523',false],[nil,5,23,nil,nil,nil,nil,nil,nil], __LINE__],
 [['23',false],[nil,nil,23,nil,nil,nil,nil,nil,nil], __LINE__],
 
 [['19990523 235521',true],[1999,5,23,23,55,21,nil,nil,nil], __LINE__],
 [['990523 235521',true],[1999,5,23,23,55,21,nil,nil,nil], __LINE__],
 [['0523 2355',false],[nil,5,23,23,55,nil,nil,nil,nil], __LINE__],
 [['23 2355',false],[nil,nil,23,23,55,nil,nil,nil,nil], __LINE__],
 
 [['19990523T235521',true],[1999,5,23,23,55,21,nil,nil,nil], __LINE__],
 [['990523T235521',true],[1999,5,23,23,55,21,nil,nil,nil], __LINE__],
 [['19990523T235521.99',true],[1999,5,23,23,55,21,nil,nil,nil], __LINE__],
 [['990523T235521.99',true],[1999,5,23,23,55,21,nil,nil,nil], __LINE__],
 [['0523T2355',false],[nil,5,23,23,55,nil,nil,nil,nil], __LINE__],
 
 [['19990523T235521+0900',true],[1999,5,23,23,55,21,'+0900',9*3600,nil], __LINE__],
 [['990523T235521-0900',true],[1999,5,23,23,55,21,'-0900',-9*3600,nil], __LINE__],
 [['19990523T235521.99+0900',true],[1999,5,23,23,55,21,'+0900',9*3600,nil], __LINE__],
 [['990523T235521.99-0900',true],[1999,5,23,23,55,21,'-0900',-9*3600,nil], __LINE__],
 [['0523T2355Z',false],[nil,5,23,23,55,nil,'Z',0,nil], __LINE__],
 
 [['19990523235521.123456+0900',true],[1999,5,23,23,55,21,'+0900',9*3600,nil], __LINE__],
 [['19990523235521.123456-0900',true],[1999,5,23,23,55,21,'-0900',-9*3600,nil], __LINE__],
 [['19990523235521,123456+0900',true],[1999,5,23,23,55,21,'+0900',9*3600,nil], __LINE__],
 [['19990523235521,123456-0900',true],[1999,5,23,23,55,21,'-0900',-9*3600,nil], __LINE__],
 
 [['990523235521,123456-0900',false],[99,5,23,23,55,21,'-0900',-9*3600,nil], __LINE__],
 [['0523235521,123456-0900',false],[nil,5,23,23,55,21,'-0900',-9*3600,nil], __LINE__],
 [['23235521,123456-0900',false],[nil,nil,23,23,55,21,'-0900',-9*3600,nil], __LINE__],
 [['235521,123456-0900',false],[nil,nil,nil,23,55,21,'-0900',-9*3600,nil], __LINE__],
 [['5521,123456-0900',false],[nil,nil,nil,nil,55,21,'-0900',-9*3600,nil], __LINE__],
 [['21,123456-0900',false],[nil,nil,nil,nil,nil,21,'-0900',-9*3600,nil], __LINE__],
 
 [['3235521,123456-0900',false],[nil,nil,3,23,55,21,'-0900',-9*3600,nil], __LINE__],
 [['35521,123456-0900',false],[nil,nil,nil,3,55,21,'-0900',-9*3600,nil], __LINE__],
 [['521,123456-0900',false],[nil,nil,nil,nil,5,21,'-0900',-9*3600,nil], __LINE__],
*/
