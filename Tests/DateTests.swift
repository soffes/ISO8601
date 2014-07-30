//
//  DateTests.swift
//  ISO8601
//
//  Created by Sam Soffes on 7/30/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import Foundation
import XCTest
import ISO8601

class DateTests: XCTestCase {
	
	// MARK: - Types
	
	struct DateTest {
		let string: String
		let year: Int?
		let month: Int?
		let day: Int?
		let hour: Int?
		let minute: Int?
		let second: Int?
		let timeZone: NSTimeZone?
		
		var dateComponents: NSDateComponents {
		let components = NSDateComponents()
			
			if let year = year {
				components.year = year
			}
			
			if let month = month {
				components.month = month
			}
			
			if let day = day {
				components.day = day
			}
			
			if let hour = hour {
				components.hour = hour
			}
			
			if let minute = minute {
				components.minute = minute
			}
			
			if let second = second {
				components.second = second
			}
			
			if let timeZone = timeZone {
				components.timeZone = timeZone
			}
			
			return components
		}
		
		init(string: String, year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil, timeZoneOffset: Int? = nil) {
			self.string = string
			self.year = year
			self.month = month
			self.day = day
			self.hour = hour
			self.minute = minute
			self.second = second
			
			if let timeZoneOffset = timeZoneOffset {
				self.timeZone = NSTimeZone(forSecondsFromGMT: timeZoneOffset * 3600)
			}
		}
	}
	
	
	// MARK: - Tests
	
	func testReading() {
		let dateTests = [
			DateTest(string: "1999-05-19T23:55:21Z", year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21),
			DateTest(string: "1999-05-19T23:55:21+09:00", year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21, timeZoneOffset: 9),
			DateTest(string: "2011-01-31T19:42:36Z", year: 2011, month: 1, day: 31, hour: 19, minute: 42, second: 36),
			DateTest(string: "2011-12-13T17:17:00-06:00", year: 2011, month: 12, day: 13, hour: 17, minute: 17, second: 0, timeZoneOffset: -6),
			DateTest(string: "1999-05-23 23:55:21", year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21),
			DateTest(string: "1999-05-23 23:55:21+09:00", year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: 9),
			DateTest(string: "1999-05-23T23:55:21-09:00", year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: -9),
			DateTest(string: "1999-05-23 23:55:21Z", year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21),
			DateTest(string: "1999-05-23T23:55:21Z", year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21),
			DateTest(string: "-1999-05-23T23:55:21Z", year: -1999, month: 5, day: 23, hour: 23, minute: 55, second: 21),
			DateTest(string: "+011985-04-12", year: 11985, month: 4, day: 12),
			DateTest(string: "+011985-04-12T10:15:30", year: 11985, month: 4, day: 12, hour: 10, minute: 15, second: 30),
			DateTest(string: "-011985-04-12", year: -11985, month: 4, day: 12),
			DateTest(string: "-011985-04-12T10:15:30", year: -11985, month: 4, day: 12, hour: 10, minute: 15, second: 30),
			DateTest(string: "02-04-12", year: 2, month: 4, day: 12),
			DateTest(string: "0002-04-12", year: 2, month: 4, day: 12)
			
			// TODO: Support micro time
			//			DateTest(string: "2013-06-27T15:39:32.508Z", year: 2013, month: 6, day: 27, hour: 15, minute: 39, second: 32),
			//			DateTest(string: "2014-03-18T20:00:00.000-07:00", year: 2014, month: 3, day: 18, hour: 20, minute: 0, second: 0, timeZoneOffset: -7),
			
			// TODO: Support missing colon in time zone
			//			DateTest(string: "1999-05-23 23:55:21+0900", year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: 9),
			//			DateTest(string: "1999-05-23 23:55:21-0900", year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: -9),
			
			// TODO: Support missing dashes in date
			//			DateTest(string: "19990523T23:55:21Z", year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21),
		]
		
		for dateTest in dateTests {
			XCTAssertEqual(ISO8601Serialization.dateComponentsForString(dateTest.string), dateTest.dateComponents, dateTest.string)
		}
	}
	
	func testWriting() {
		let dateTests = [
			DateTest(string: "1999-05-19T23:55:21Z", year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21),
			DateTest(string: "1999-05-19T23:55:21+09:00", year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21, timeZoneOffset: 9),
			DateTest(string: "2011-01-31T19:42:36Z", year: 2011, month: 1, day: 31, hour: 19, minute: 42, second: 36),
			DateTest(string: "2011-12-13T17:17:00-06:00", year: 2011, month: 12, day: 13, hour: 17, minute: 17, second: 0, timeZoneOffset: -6),
			DateTest(string: "2013-06-27T15:39:32Z", year: 2013, month: 6, day: 27, hour: 15, minute: 39, second: 32),
			DateTest(string: "2014-03-18T20:00:00-07:00", year: 2014, month: 3, day: 18, hour: 20, minute: 0, second: 0, timeZoneOffset: -7)
		]
		
		for dateTest in dateTests {
			XCTAssertEqual(ISO8601Serialization.stringForDateComponents(dateTest.dateComponents), dateTest.string)
		}
	}
}