//
//  NSDate+String.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 27/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Foundation

extension NSDate: Comparable { }

public func == (lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.compare(rhs) == .OrderedSame
}

public func < (lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.compare(rhs) == .OrderedAscending
}

extension NSDate {
  public class func dateAt(year year: Int, month: Int, day: Int) -> NSDate? {
    let components = NSDateComponents()
    components.year = year
    components.month = month
    components.day = day
    return NSCalendar.currentCalendar().dateFromComponents(components)
  }
}

// MARK: forward and backward
extension NSDate {
  public func daysBefore(days: Int = 1) -> NSDate {
    return NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: -days, toDate: self, options: [])!
  }

  public func dayBefore() -> NSDate {
    return daysBefore(1)
  }

  public func daysAfter(days: Int = 1) -> NSDate {
    return NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: days, toDate: self, options: [])!
  }

  public func dayAfter() -> NSDate {
    return daysAfter(1)
  }
}

// MARK: String
extension NSDate {
  public class func dateFromString(string: String, format: String) -> NSDate? {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.dateFromString(string)
  }

  public func toString(format format: String) -> String {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.stringFromDate(self)
  }
}
