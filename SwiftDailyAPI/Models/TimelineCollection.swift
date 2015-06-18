//
//  TimelineCollection.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 15/06/2015.
//  Copyright © 2015 nickTD. All rights reserved.
//

import Foundation

public struct TimelineCollection<T>: CollectionType {
  var storage: [DateIndex: T] = [:]

  public var startIndex: DateIndex
  public var endIndex: DateIndex

  public init(startDate: NSDate, endDate: NSDate) {
    startIndex = DateIndex(startDate)
    endIndex = DateIndex(endDate)
  }

  // MARK: Subscrit with `DateIndex`
  public subscript (i: DateIndex) -> T? {
    get {
      return storage[i]
    }
    set {
      storage[i] = newValue

      // The `TimelineCollection` expands dynamically to include the earliest and latest dates.
      // To implement this functionality, any time a new date-image pair is stored using this
      // subscript, we check to see if the date is before the `startIndex` or after the `endIndex`.
      if i.date.compare(startIndex.date) == .OrderedAscending {
        startIndex = i
      }

      let endIndexComparison = i.date.compare(endIndex.date)
      if endIndexComparison == .OrderedDescending || endIndexComparison == .OrderedSame {
        // The `endIndex` is always one past the end so that iteration and `count` know when
        // to stop, so compute the successor before storing the new `endIndex`.
        endIndex = i.successor()
      }
    }
  }
}

// MARK: Subscript with `NSDate`
extension TimelineCollection {
  public subscript (date: NSDate) -> T? {
    get {
      return self[DateIndex(date)]
    }
    set {
      self[DateIndex(date)] = newValue
    }
  }
}

// MARK: Subscript with `Int` for use with `UITableView`
extension TimelineCollection {
  // Could give dateIndex out of range.
  // NOTE: Why it is going back in time?
  // Because in `UITableView` sections' indexes start at top.
  // The toppest section has index as zero.
  // And we want to show the timeline in a reverse chronological order.
  public func dateIndexAtIndex(i: Int) -> DateIndex {
    return endIndex.advancedBy(-i + -1)
  }

  public func indexAtDate(date: NSDate) -> Int {
    let index = dateIndexAtIndex(0)
    return DateIndex(date).distanceTo(index)
  }

  public func dateInRange(date: NSDate) -> Bool {
    return startIndex.date < date && date < endIndex.date
  }

  public subscript (i: Int) -> T? {
    get {
      return self[dateIndexAtIndex(i)]
    }
    set {
      self[dateIndexAtIndex(i)] = newValue
    }
  }
}
