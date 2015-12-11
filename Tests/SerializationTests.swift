//
//  SerializationTests.swift
//  ISO8601Tests
//
//  Created by Sam Soffes on 7/30/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import ISO8601
import Foundation
import XCTest

class SerializationTests: XCTestCase {
	func testZulu() {
		XCTAssertEqual(parse("1999-05-19T23:55:21"), components(year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21))
		XCTAssertEqual(parse("1999-05-19T23:55:21+00:00"), components(year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21, timeZoneOffset: 0))
		XCTAssertEqual(parse("1999-05-19T23:55:21Z"), components(year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21, timeZoneOffset: 0))
	}

	func testReadingUTC() {
		XCTAssertEqual(parse("1971-02-03T04:05:06.789Z"), components(year: 1971, month: 2, day: 3, hour: 4, minute: 5, second: 6, timeZoneOffset: 0))
		XCTAssertEqual(parse("1971-02-03T04:05:06.78Z"), components(year: 1971, month: 2, day: 3, hour: 4, minute: 5, second: 6, timeZoneOffset: 0))
		XCTAssertEqual(parse("1971-02-03T04:05:06.7Z"), components(year: 1971, month: 2, day: 3, hour: 4, minute: 5, second: 6, timeZoneOffset: 0))
		XCTAssertEqual(parse("1971-02-03T04:05:06Z"),  components(year: 1971, month: 2, day: 3, hour: 4, minute: 5, second: 6, timeZoneOffset: 0))
		XCTAssertEqual(parse("1971-02-03T04:05Z"), components(year: 1971, month: 2, day: 3, hour: 4, minute: 5, timeZoneOffset: 0))
		XCTAssertEqual(parse("1970-01-01T00:00:00.000Z"), components(year: 1970, month: 1, day: 1, hour: 0, minute: 0, second: 0, timeZoneOffset: 0))
		XCTAssertEqual(parse("1970-06-30T01:06:40.981Z"), components(year: 1970, month: 6, day: 30, hour: 1, minute: 6, second: 40, timeZoneOffset: 0))
		XCTAssertEqual(parse("2058-02-20T18:29:11.100Z"), components(year: 2058, month: 2, day: 20, hour: 18, minute: 29, second: 11, timeZoneOffset: 0))
		XCTAssertEqual(parse("3001-01-01T08:00:00.000Z"), components(year: 3001, month: 1, day: 1, hour: 8, minute: 0, second: 0, timeZoneOffset: 0))
		XCTAssertEqual(parse("2013-02-20T18:29:11.100Z"), components(year: 2013, month: 2, day: 20, hour: 18, minute: 29, second: 11, timeZoneOffset: 0))
	}

	func testReadingTimeZones() {
		XCTAssertEqual(parse("1971-02-03T09:16:06.789+0511"), components(year: 1971, month: 2, day: 3, hour: 9, minute: 16, second: 6, timeZoneOffset: 18660))
		XCTAssertEqual(parse("1971-02-03T09:16:06.78+0511"), components(year: 1971, month: 2, day: 3, hour: 9, minute: 16, second: 6, timeZoneOffset: 18660))
		XCTAssertEqual(parse("1971-02-03T09:16:06.7+0511"), components(year: 1971, month: 2, day: 3, hour: 9, minute: 16, second: 6, timeZoneOffset: 18660))
		XCTAssertEqual(parse("1971-02-03T09:16:06+0511"), components(year: 1971, month: 2, day: 3, hour: 9, minute: 16, second: 6, timeZoneOffset: 18660))
		XCTAssertEqual(parse("1971-02-03T09:16+0511"), components(year: 1971, month: 2, day: 3, hour: 9, minute: 16, timeZoneOffset: 18660))
		XCTAssertEqual(parse("1970-06-29T21:06:40.981-0400"), components(year: 1970, month: 6, day: 29, hour: 21, minute: 6, second: 40, timeZoneOffset: -14400))
		XCTAssertEqual(parse("1969-12-31T16:00:00.000-0800"), components(year: 1969, month: 12, day: 31, hour: 16, minute: 0, second: 0, timeZoneOffset: -28800))
		XCTAssertEqual(parse("2058-02-20T13:29:11.100-0500"), components(year: 2058, month: 2, day: 20, hour: 13, minute: 29, second: 11, timeZoneOffset: -18000))
		XCTAssertEqual(parse("2013-02-20T13:29:11.100-0500"), components(year: 2013, month: 2, day: 20, hour: 13, minute: 29, second: 11, timeZoneOffset: -18000))
		XCTAssertEqual(parse("2013-02-20T13:29:11.100-0501"), components(year: 2013, month: 2, day: 20, hour: 13, minute: 29, second: 11, timeZoneOffset: -18060))
	}

	func testLeapYear() {
		XCTAssertEqual(parse("1972-02-29T00:00:00.000Z"), components(year: 1972, month: 2, day: 29, hour: 0, minute: 0, second: 0, timeZoneOffset: 0))
		XCTAssertEqual(parse("1976-02-29T00:00:00.000Z"), components(year: 1976, month: 2, day: 29, hour: 0, minute: 0, second: 0, timeZoneOffset: 0))
		XCTAssertEqual(parse("1980-02-29T00:00:00.000Z"), components(year: 1980, month: 2, day: 29, hour: 0, minute: 0, second: 0, timeZoneOffset: 0))
		XCTAssertEqual(parse("1984-02-29T00:00:00.000Z"), components(year: 1984, month: 2, day: 29, hour: 0, minute: 0, second: 0, timeZoneOffset: 0))
		XCTAssertEqual(parse("1988-02-29T00:00:00.000Z"), components(year: 1988, month: 2, day: 29, hour: 0, minute: 0, second: 0, timeZoneOffset: 0))
		XCTAssertEqual(parse("1992-02-29T00:00:00.000Z"), components(year: 1992, month: 2, day: 29, hour: 0, minute: 0, second: 0, timeZoneOffset: 0))
		XCTAssertEqual(parse("1996-02-29T00:00:00.000Z"), components(year: 1996, month: 2, day: 29, hour: 0, minute: 0, second: 0, timeZoneOffset: 0))
		XCTAssertEqual(parse("2000-02-29T00:00:00.000Z"), components(year: 2000, month: 2, day: 29, hour: 0, minute: 0, second: 0, timeZoneOffset: 0))
		XCTAssertEqual(parse("2004-02-29T00:00:00.000Z"), components(year: 2004, month: 2, day: 29, hour: 0, minute: 0, second: 0, timeZoneOffset: 0))
		XCTAssertEqual(parse("2008-02-29T00:00:00.000Z"), components(year: 2008, month: 2, day: 29, hour: 0, minute: 0, second: 0, timeZoneOffset: 0))
		XCTAssertEqual(parse("2012-02-29T00:00:00.000Z"), components(year: 2012, month: 2, day: 29, hour: 0, minute: 0, second: 0, timeZoneOffset: 0))
		XCTAssertEqual(parse("2016-02-29T00:00:00.000Z"), components(year: 2016, month: 2, day: 29, hour: 0, minute: 0, second: 0, timeZoneOffset: 0))
	}

	func testReadingExtensively() {
		XCTAssertEqual(parse("1999-05-19T23:55:21Z"), components(year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21, timeZoneOffset: 0))
		XCTAssertEqual(parse("1999-05-19T23:55:21+09:00"), components(year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21, timeZoneOffset: 9 * 60 * 60))
		XCTAssertEqual(parse("2011-01-31T19:42:36Z"), components(year: 2011, month: 1, day: 31, hour: 19, minute: 42, second: 36, timeZoneOffset: 0))
		XCTAssertEqual(parse("2011-12-13T17:17:00-06:00"), components(year: 2011, month: 12, day: 13, hour: 17, minute: 17, second: 0, timeZoneOffset: -6 * 60 * 60))
		XCTAssertEqual(parse("1999-05-23 23:55:21"), components(year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21))
		XCTAssertEqual(parse("1999-05-23 23:55:21+09:00"), components(year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: 9 * 60 * 60))
		XCTAssertEqual(parse("1999-05-23T23:55:21-09:00"), components(year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: -9 * 60 * 60))
		XCTAssertEqual(parse("1999-05-23T23:55:21-09:30"), components(year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: -9.5 * 60 * 60))
		XCTAssertEqual(parse("1999-05-23 23:55:21Z"), components(year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: 0))
		XCTAssertEqual(parse("1999-05-23T23:55:21Z"), components(year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: 0))
		XCTAssertEqual(parse("-1999-05-23T23:55:21Z"), components(year: -1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: 0))
		XCTAssertEqual(parse("+011985-04-12"), components(year: 11985, month: 4, day: 12))
		XCTAssertEqual(parse("+011985-04-12T10:15:30"), components(year: 11985, month: 4, day: 12, hour: 10, minute: 15, second: 30))
		XCTAssertEqual(parse("-011985-04-12"), components(year: -11985, month: 4, day: 12))
		XCTAssertEqual(parse("-011985-04-12T10:15:30"), components(year: -11985, month: 4, day: 12, hour: 10, minute: 15, second: 30))
		XCTAssertEqual(parse("02-04-12"), components(year: 2, month: 4, day: 12))
		XCTAssertEqual(parse("0002-04-12"), components(year: 2, month: 4, day: 12))
		XCTAssertEqual(parse("2013-06-27T15:39:32.508Z"), components(year: 2013, month: 6, day: 27, hour: 15, minute: 39, second: 32, timeZoneOffset: 0))
		XCTAssertEqual(parse("2014-03-18T20:00:00.000-07:00"), components(year: 2014, month: 3, day: 18, hour: 20, minute: 0, second: 0, timeZoneOffset: -7 * 60 * 60))
		XCTAssertEqual(parse("1999-05-23 23:55:21+0900"), components(year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: 9 * 60 * 60))
		XCTAssertEqual(parse("1999-05-23 23:55:21-0900"), components(year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: -9 * 60 * 60))
		XCTAssertEqual(parse("1999-05-23 23:55:21-1100"), components(year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: -11 * 60 * 60))
		XCTAssertEqual(parse("1999-05-23 23:55:21+1400"), components(year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: 14 * 60 * 60))
		XCTAssertEqual(parse("1999-05-23 23:55:21+0000"), components(year: 1999, month: 5, day: 23, hour: 23, minute: 55, second: 21, timeZoneOffset: 0))
		XCTAssertEqual(parse("1999-05-19T23:55:21+00:00"), components(year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21, timeZoneOffset: 0))
		XCTAssertEqual(parse("1999-05-19T23:55:21-00:00"), components(year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21, timeZoneOffset: 0))
		XCTAssertEqual(parse("1999-05-19T23:55:21+0000"), components(year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21, timeZoneOffset: 0))
		XCTAssertEqual(parse("1999-05-19T23:55:21-0000"), components(year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21, timeZoneOffset: 0))
		XCTAssertEqual(parse("2014-03-13"), components(year: 2014, month: 3, day: 13))
		XCTAssertEqual(parse("2014-03-13T10:42:12"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12))
		XCTAssertEqual(parse("2014-03-13T10:42:12"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12))
		XCTAssertEqual(parse("2014-03-13T10:42:12.123"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12))
		XCTAssertEqual(parse("2014-03-13T10:42:12.123Z"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12, timeZoneOffset: 0))
		XCTAssertEqual(parse("2014-03-13T10:42:12Z"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12, timeZoneOffset: 0))
		XCTAssertEqual(parse("2014-03-13T10:42:12.123+07:00"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12, timeZoneOffset: 7 * 60 * 60))
		XCTAssertEqual(parse("2014-03-13T10:42:12.123-09:30"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12, timeZoneOffset: -9.5 * 60 * 60))
		XCTAssertEqual(parse("2014-03-13T10:42:12+07:00"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12, timeZoneOffset: 7 * 60 * 60))
		XCTAssertEqual(parse("2014-03-13T10:42:12-09:30"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12, timeZoneOffset: -9.5 * 60 * 60))
	}

	func testPartials() {
		XCTAssertEqual(parse("2015"), components(year: 2015))
		XCTAssertEqual(parse("2015-💩"), components(year: 2015))
		XCTAssertEqual(parse("2015-03"), components(year: 2015, month: 3))
		XCTAssertEqual(parse("2015-03-💩"), components(year: 2015, month: 3))
		XCTAssertEqual(parse("2015-03-13"), components(year: 2015, month: 3, day: 13))
		XCTAssertEqual(parse("2015-03-13-💩"), components(year: 2015, month: 3, day: 13))
		XCTAssertEqual(parse("2015-03-13T💩"), components(year: 2015, month: 3, day: 13))
		XCTAssertEqual(parse("2015-03-13T10"), components(year: 2015, month: 3, day: 13, hour: 10))
		XCTAssertEqual(parse("2015-03-13T10:💩"), components(year: 2015, month: 3, day: 13, hour: 10))
		XCTAssertEqual(parse("2015-03-13T10:42"), components(year: 2015, month: 3, day: 13, hour: 10, minute: 42))
		XCTAssertEqual(parse("2015-03-13T10:42:💩"), components(year: 2015, month: 3, day: 13, hour: 10, minute: 42))
		XCTAssertEqual(parse("2015-03-13T10:42:10"), components(year: 2015, month: 3, day: 13, hour: 10, minute: 42, second: 10))
		XCTAssertEqual(parse("2015-03-13T10:42:10+💩"), components(year: 2015, month: 3, day: 13, hour: 10, minute: 42, second: 10))
	}

//	func testReadingWithoutSeparators() {
//		XCTAssertEqual(parse("20140313"), components(year: 2014, month: 3, day: 13))
//		XCTAssertEqual(parse("20140313T104212"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("20140313T104212.12345"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("2014-03-13T10:42:12.12345"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("20140313104212"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("20140313104212.123"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("20140313104212.123Z"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("20140313104212Z"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("20140313104212.123+0700"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12, timeZoneOffset: 7 * 60 * 60))
//		XCTAssertEqual(parse("20140313104212.123-0930"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12, timeZoneOffset: -9.5 * 60 * 60))
//		XCTAssertEqual(parse("20140313104212+0700"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12, timeZoneOffset: 7 * 60 * 60))
//		XCTAssertEqual(parse("20140313104212-0930"), components(year: 2014, month: 3, day: 13, hour: 10, minute: 42, second: 12, timeZoneOffset: -9.5 * 60 * 60))
//	}

//	func testReadingOnlyTime() {
//		XCTAssertEqual(parse("10:42:12"), components(hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("10:42:12.1"), components(hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("10:42:12.12"), components(hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("10:42:12.123"), components(hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("10:42:12.1234"), components(hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("10:42:12.12345"), components(hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("10:42:12.12345Z"), components(hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("10:42:12Z"), components(hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("10:42:12.123+07:00"), components(hour: 10, minute: 42, second: 12, timeZoneOffset: 7 * 60 * 60))
//		XCTAssertEqual(parse("10:42:12.123-09:30"), components(hour: 10, minute: 42, second: 12, timeZoneOffset: -9.5 * 60 * 60))
//		XCTAssertEqual(parse("10:42:12+07:00"), components(hour: 10, minute: 42, second: 12, timeZoneOffset: 7 * 60 * 60))
//		XCTAssertEqual(parse("10:42:12-09:30"), components(hour: 10, minute: 42, second: 12, timeZoneOffset: -9.5 * 60 * 60))
//		XCTAssertEqual(parse("104212"), components(hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("104212"), components(hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("104212.123"), components(hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("104212.123Z"), components(hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("104212Z"), components(hour: 10, minute: 42, second: 12))
//		XCTAssertEqual(parse("104212.123+0700"), components(hour: 10, minute: 42, second: 12, timeZoneOffset: 7 * 60 * 60))
//		XCTAssertEqual(parse("104212.123-0930"), components(hour: 10, minute: 42, second: 12, timeZoneOffset: -9.5 * 60 * 60))
//		XCTAssertEqual(parse("104212+0700"), components(hour: 10, minute: 42, second: 12, timeZoneOffset: 7 * 60 * 60))
//		XCTAssertEqual(parse("104212-0930"), components(hour: 10, minute: 42, second: 12, timeZoneOffset: -9.5 * 60 * 60))
//	}

	func testWriting() {
		XCTAssertEqual("1999-05-19T23:55:21", serialize(components(year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21)))
		XCTAssertEqual("1999-05-19T23:55:21Z", serialize(components(year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21, timeZoneOffset: 0)))
		XCTAssertEqual("1999-05-19T23:55:21+09:00", serialize(components(year: 1999, month: 5, day: 19, hour: 23, minute: 55, second: 21, timeZoneOffset: 9 * 60 * 60)))
		XCTAssertEqual("2011-01-31T19:42:36Z", serialize(components(year: 2011, month: 1, day: 31, hour: 19, minute: 42, second: 36, timeZoneOffset: 0)))
		XCTAssertEqual("2011-12-13T17:17:00-06:00", serialize(components(year: 2011, month: 12, day: 13, hour: 17, minute: 17, second: 0, timeZoneOffset: -6 * 60 * 60)))
		XCTAssertEqual("2013-06-27T15:39:32Z", serialize(components(year: 2013, month: 6, day: 27, hour: 15, minute: 39, second: 32, timeZoneOffset: 0)))
		XCTAssertEqual("2014-03-18T20:00:00-07:00", serialize(components(year: 2014, month: 3, day: 18, hour: 20, minute: 0, second: 0, timeZoneOffset: -7 * 60 * 60)))
		XCTAssertEqual("2014-03-18", serialize(components(year: 2014, month: 3, day: 18)))
		XCTAssertEqual("23:55:21", serialize(components(hour: 23, minute: 55, second: 21)))
		XCTAssertEqual(nil, serialize(components()))
	}
}
