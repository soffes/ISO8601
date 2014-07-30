# ISO8601

Fast [ISO8601](http://en.wikipedia.org/wiki/ISO8601) date parser and writer for iOS & Mac.


## Installation

Simply install with [CocoaPods](https://cocoapods.org):

``` ruby
pod 'ISO8601'
```

For manual installation, I recommend adding the project as a subproject to your project or workspace and adding the framework as a target dependency.


## Usage

First, import the appropriate header:

``` objc
#import <ISO8601/ISO8601.h>
```

This library uses `NSDateComponents` for reading and writing. Here's an example:

``` objc
// Reading
NSDateComponents *dateComponents = [ISO8601Serialization dateComponentsForString:@"1999-05-19T23:55:21+09:00"];

// Writing
NSString *ISO8601String = [ISO8601Serialization stringForDateComponents:dateComponents];
```

There is an `NSDate` category for convenient conversion:

``` objc
// Reading
NSDate *date = [NSDate dateWithISO8601String:@"1999-05-19T23:55:21+09:00"];

// Writing
NSString *ISO8601String = [date ISO8601String];
```

If you require more control over conversion or need to know the input time zone, you can use the advanced methods the category provides:


``` objc
// Reading
NSTimeZone *timeZone;
NSDate *date = [NSDate dateWithISO8601String:@"1999-05-19T23:55:21+09:00" timeZone:&timeZone usingCalendar:calendarOrNil];

// Writing
NSString *ISO8601String = [date ISO8601StringWithTimeZone:timeZoneOrNil usingCalendar:calendarOrNil];
```

Enjoy.
