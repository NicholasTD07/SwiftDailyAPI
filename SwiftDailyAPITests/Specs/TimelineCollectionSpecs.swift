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
    describe("count") {
      var timeline = TimelineCollection<Int>(startDate: NSDate(), endDate: NSDate())
      let today = DateIndex()

      it("starts at zero") { expect(timeline.count).to(equal(0)) }

      it("increments when adding stuff") {
        timeline[today] = 0
        expect(timeline.count).to(equal(1))

        timeline[today.advancedBy(1)] = 1
        expect(timeline.count).to(equal(2))
      }

      // NOTE: Why there's no spec for decremnt?
      //      It is easy to implement a `removeAtIndex` func like the one `Dictionary` have,
      //      since we use a dictionary to store all data.
      //      However, the problem is, because `count` is provided by the `CollectionType` protocol,
      //      and it uses the `startIndex` and `endIndex` to calculate the `count`.
      //      It looks complicated to update `count` in `removeAtIndex`, because indexes are dates.
      //      Plus it is not super important and I don't have much time.
    }

    it("stores stuff") {
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
      expect(timeline[0]).to(equal(5))  // five days later
      expect(timeline[5]).to(equal(0))  // today
      expect(timeline[8]).to(equal(-3)) // three days ago
    }
  }
}
