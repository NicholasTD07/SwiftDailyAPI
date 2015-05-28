//
//  DailyAPISpecs.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 27/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Quick
import Nimble
import SwiftDailyAPI

class DailyAPISpecs: QuickSpec {
  override func spec() {
    let dailyAPI = DailyAPI(userAgent: "SwiftDailySpec")
    it("loads latest daily") {
      var latestDaily: LatestDailyNews? = nil
      dailyAPI.latestDaily() { (latestDailyFromAPI: LatestDailyNews?) in
        latestDaily = latestDailyFromAPI
      }

      expect(latestDaily).toEventuallyNot(beNil(), timeout: 10)
      expect(latestDaily?.date).toEventuallyNot(beNil(), timeout: 10)
      expect(latestDaily?.news).toEventuallyNot(beEmpty(), timeout: 10)
      expect(latestDaily?.topNews).toEventuallyNot(beEmpty(), timeout: 10)
    }
  }
}
