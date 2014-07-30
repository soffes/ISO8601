//
//  SerializationTests.swift
//  ISO8601Tests
//
//  Created by Sam Soffes on 7/30/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import Foundation
import XCTest
import ISO8601

class SerializationTests: XCTestCase {
	func testReading() {
		let dateTests = [
			Components(string: "1999-05-19T23:55:21Z", year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21),
			Components(string: "1999-05-19T23:55:21+09:00", year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21, timeZoneOffset: 9),
			Components(string: "2011-01-31T19:42:36Z", year: 2011, month: 1, day: 31, hour: 19, minute: 42, second: 36),
			Components(string: "2011-12-13T17:17:00-06:00", year: 2011, month: 12, day: 13, hour: 17, minute: 17, second: 0, timeZoneOffset: -6),
			Components(string: "1999-05-23 23:55:21", year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21),
			Components(string: "1999-05-23 23:55:21+09:00", year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: 9),
			Components(string: "1999-05-23T23:55:21-09:00", year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: -9),
			Components(string: "1999-05-23 23:55:21Z", year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21),
			Components(string: "1999-05-23T23:55:21Z", year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21),
			Components(string: "-1999-05-23T23:55:21Z", year: -1999, month: 5, day: 23, hour: 23, minute: 55, second: 21),
			Components(string: "+011985-04-12", year: 11985, month: 4, day: 12),
			Components(string: "+011985-04-12T10:15:30", year: 11985, month: 4, day: 12, hour: 10, minute: 15, second: 30),
			Components(string: "-011985-04-12", year: -11985, month: 4, day: 12),
			Components(string: "-011985-04-12T10:15:30", year: -11985, month: 4, day: 12, hour: 10, minute: 15, second: 30),
			Components(string: "02-04-12", year: 2, month: 4, day: 12),
			Components(string: "0002-04-12", year: 2, month: 4, day: 12)

			// TODO: Support micro time
//			Components(string: "2013-06-27T15:39:32.508Z", year: 2013, month: 6, day: 27, hour: 15, minute: 39, second: 32),
//			Components(string: "2014-03-18T20:00:00.000-07:00", year: 2014, month: 3, day: 18, hour: 20, minute: 0, second: 0, timeZoneOffset: -7),
			
			// TODO: Support missing colon in time zone
//			Components(string: "1999-05-23 23:55:21+0900", year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: 9),
//			Components(string: "1999-05-23 23:55:21-0900", year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: -9),
			
			// TODO: Support missing dashes in date
//			Components(string: "19990523T23:55:21Z", year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21),
		]
		
		for dateTest in dateTests {
			XCTAssertEqual(ISO8601Serialization.dateComponentsForString(dateTest.string), dateTest.dateComponents, dateTest.string)
		}
	}
	
	func testWriting() {
		let dateTests = [
			Components(string: "1999-05-19T23:55:21Z", year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21),
			Components(string: "1999-05-19T23:55:21+09:00", year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21, timeZoneOffset: 9),
			Components(string: "2011-01-31T19:42:36Z", year: 2011, month: 1, day: 31, hour: 19, minute: 42, second: 36),
			Components(string: "2011-12-13T17:17:00-06:00", year: 2011, month: 12, day: 13, hour: 17, minute: 17, second: 0, timeZoneOffset: -6),
			Components(string: "2013-06-27T15:39:32Z", year: 2013, month: 6, day: 27, hour: 15, minute: 39, second: 32),
			Components(string: "2014-03-18T20:00:00-07:00", year: 2014, month: 3, day: 18, hour: 20, minute: 0, second: 0, timeZoneOffset: -7)
		]
		
		for dateTest in dateTests {
			XCTAssertEqual(ISO8601Serialization.stringForDateComponents(dateTest.dateComponents), dateTest.string)
		}
	}
}
