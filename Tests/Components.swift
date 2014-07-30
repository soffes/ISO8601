//
//  Components.swift
//  ISO8601
//
//  Created by Sam Soffes on 7/30/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import Foundation

/// Simple struct for encapsulating date components and an ISO8601 string for testing purposes.
struct Components {
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
	
	init(string: String, year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil, timeZoneOffset: NSTimeInterval? = nil) {
		self.string = string
		self.year = year
		self.month = month
		self.day = day
		self.hour = hour
		self.minute = minute
		self.second = second
		
		if let timeZoneOffset = timeZoneOffset {
			self.timeZone = NSTimeZone(forSecondsFromGMT: Int(timeZoneOffset * 3600))
		}
	}
}
