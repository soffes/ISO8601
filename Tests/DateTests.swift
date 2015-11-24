//
//  DateTests.swift
//  ISO8601
//
//  Created by Sam Soffes on 7/30/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import Foundation
import XCTest

class DateTests: XCTestCase {
	func testReading() {
		var timeZone: NSTimeZone?
		XCTAssertEqual(NSDate(ISO8601String: "2014-07-30T22:35:23Z", timeZone: &timeZone, usingCalendar: nil), NSDate(timeIntervalSince1970: 1406759723))
		XCTAssertEqual(timeZone!.secondsFromGMT, 0)
		
		XCTAssertEqual(NSDate(ISO8601String: "2014-07-30T15:35:23-07:00", timeZone: &timeZone, usingCalendar: nil), NSDate(timeIntervalSince1970: 1406759723))
		XCTAssertEqual(timeZone!.secondsFromGMT, -7 * 3600)
	}

    func testFailingReading() {
        XCTAssertNil(NSDate(ISO8601String: "WRONG DATA"))
    }
	
	func testWriting() {
		XCTAssertEqual(NSDate(timeIntervalSince1970: 1406759723).ISO8601StringWithTimeZone(nil, usingCalendar: nil), "2014-07-30T22:35:23Z")
	}
}
