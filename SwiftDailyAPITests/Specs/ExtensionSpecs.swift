//
//  ExtensionSpecs.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 16/06/2015.
//  Copyright © 2015 nickTD. All rights reserved.
//

import Quick
import Nimble
import SwiftDailyAPI

class ExtensionSpecs: QuickSpec {
  override func spec() {
    describe("NSDate.init(_ year:month:day:)") {
      it("returns the correct date") {
        let date = NSDate.dateAt(year: 2015, month: 5, day: 25)!

        let components = NSDateComponents()
        components.year = 2015
        components.month = 5
        components.day = 25
        let theDate = NSCalendar.currentCalendar().dateFromComponents(components)!

        expect(date.compare(theDate)).to(equal(NSComparisonResult.OrderedSame))

        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        expect(dateFormatter.stringFromDate(date)).to(equal("20150525"))
      }
    }

    describe("NSDate.daysBefore") {
      it("returns date before the date") {
        let today = NSDate()
        let dayBeforeToday = today.daysBefore(1)

        expect(dayBeforeToday.compare(today)).to(equal(NSComparisonResult.OrderedAscending))
      }
    }

    describe("NSDate.dayslater") {
      it("returns date after the date") {
        let today = NSDate()
        let dayAfterToday = today.daysAfter(1)

        expect(dayAfterToday.compare(today)).to(equal(NSComparisonResult.OrderedDescending))
      }
    }

    it("is comparable") {
      let today = NSDate()
      expect(today) < today.dayAfter()
      expect(today) > today.dayBefore()
    }
  }
}
