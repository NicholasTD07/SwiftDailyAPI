//
//  NSDate+String.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 27/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Foundation
import Argo

extension NSDate {

  public func daysBefore(days: Int = 1) -> NSDate {
    return NSCalendar.currentCalendar().dateByAddingUnit(.CalendarUnitDay, value: days, toDate: self, options: nil)!
  }

  public func dayBefore() -> NSDate {
    return daysBefore(days: 1)
  }

  // MARK: String
  public class func dateFromString(string: String, format: String) -> NSDate? {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.dateFromString(string)
  }

  public func toString(#format: String) -> String {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.stringFromDate(self)
  }
}

public func toNSDate(format: String)(dateString: String) -> Decoded<NSDate> {
  return .fromOptional(NSDate.dateFromString(dateString, format: format))
}
