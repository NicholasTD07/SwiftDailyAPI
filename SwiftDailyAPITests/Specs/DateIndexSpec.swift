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

    it("has the correct date") {
      let today = NSDate()
      let dateIndex = DateIndex(today)

      expect(dateFormatter.stringFromDate(today))
        .to(equal(dateFormatter.stringFromDate(dateIndex.date)))
    }
  }
}
