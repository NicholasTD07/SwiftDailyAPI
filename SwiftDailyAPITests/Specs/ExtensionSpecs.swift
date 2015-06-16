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
    describe("NSDate.daysBefore") {
      it("returns date before the date") {
        let today = NSDate()
        let dayBeforeToday = today.daysBefore(1)

        expect(dayBeforeToday.compare(today)).to(equal(NSComparisonResult.OrderedAscending))
      }
    }

    describe("NSDate.dayslater") {
      fit("returns date after the date") {
        let today = NSDate()
        let dayAfterToday = today.daysAfter(1)

        expect(dayAfterToday.compare(today)).to(equal(NSComparisonResult.OrderedDescending))
      }
    }
}
}
