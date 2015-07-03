//
//  DateIndex.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 15/06/2015.
//  Copyright © 2015 nickTD. All rights reserved.
//

import Foundation

public struct DateIndex {
  public let date: NSDate
  private var calendar = NSCalendar.currentCalendar()

  public init(_ date: NSDate = NSDate()) {
    self.date = calendar.startOfDayForDate(date)
  }
}

public func == (lhs: DateIndex, rhs: DateIndex) -> Bool {
  return lhs.date == rhs.date
}

extension DateIndex: Equatable { }

extension DateIndex: Hashable {
  public var hashValue: Int {
    return date.hashValue
  }
}

extension DateIndex: RandomAccessIndexType {
  public func successor() -> DateIndex {
    let nextDay = calendar.dateByAddingUnit(.CalendarUnitDay, value: 1, toDate: date, options: nil)!
    return DateIndex(nextDay)
  }

  public func predecessor() -> DateIndex {
    let previousDay = calendar.dateByAddingUnit(.CalendarUnitDay, value: -1, toDate: date, options: nil)!
    return DateIndex(previousDay)
  }

  public func advancedBy(n: Int) -> DateIndex {
    let advancedDate = calendar.dateByAddingUnit(.CalendarUnitDay, value: n, toDate: date, options: nil)!
    return DateIndex(advancedDate)
  }

  public func distanceTo(other: DateIndex) -> Int {
    return calendar.components(.CalendarUnitDay, fromDate: date, toDate: other.date, options: nil).day
  }
}
