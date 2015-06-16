//
//  TimelineCollectionSpecs.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 15/06/2015.
//  Copyright © 2015 nickTD. All rights reserved.
//

import Quick
import Nimble
import SwiftDailyAPI

class TimelineCollectionSpecs: QuickSpec {
  override func spec() {
    it("") {
      var timeline = TimelineCollection<Int>(startDate: NSDate(), endDate: NSDate())
      let today = DateIndex()
      let threeDaysAgo = today.advancedBy(-3)
      let fiveDaysLater = today.advancedBy(5)

      timeline[threeDaysAgo] = -3
      timeline[today] = 0
      timeline[fiveDaysLater] = 5

      let todaysDate = NSDate()
      let calendar = NSCalendar.currentCalendar()
      expect(timeline[calendar.dateByAddingUnit(.Day, value: -3, toDate: NSDate(), options: [])!]).to(equal(-3))
      expect(timeline[todaysDate]).to(equal(0))
      expect(timeline[calendar.dateByAddingUnit(.Day, value: 5, toDate: NSDate(), options: [])!]).to(equal(5))


      // The confusing nature of automaticly updating the start and end indexes.
      expect(timeline[0]).to(equal(-3)) // three days ago
      expect(timeline[3]).to(equal(0))  // today
      expect(timeline[8]).to(equal(5))  // five days later
    }
  }
}
