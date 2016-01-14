//
//  DateIndexSpec.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 14/01/2016.
//  Copyright © 2016 nickTD. All rights reserved.
//

import Quick
import Nimble
import SwiftDailyAPI

class DateIndexSpec: QuickSpec {
  override func spec() {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = DailyConstants.dateFormat

    let todaysDate = NSDate()
    let dateBeforeToday = NSDate().dayBefore()

    let today = DateIndex(todaysDate)
    let tomorrow = today.successor()
    let yesterday = today.predecessor()


    it("has the correct date") {
      expect(dateFormatter.stringFromDate(todaysDate))
        .to(equal(dateFormatter.stringFromDate(today.date)))
    }

    it("yesterday is not today") {
      expect(today == yesterday).toNot(beTrue())
      expect(today.hashValue == yesterday.hashValue).toNot(beTrue())
    }

    fit("tomorrow is one day later") {
      expect(today.distanceTo(tomorrow)).to(equal(1))
    }
  }
}
