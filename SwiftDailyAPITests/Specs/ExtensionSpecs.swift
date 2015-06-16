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
      it("gives date before the date") {
        let today = NSDate()
        let daysBeforeToday = today.daysBefore(1)

        expect(daysBeforeToday.compare(today)).to(equal(NSComparisonResult.OrderedAscending))
      }
    }
  }
}
