//
//  Xcode7PlusSwift2.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 9/06/2015.
//  Copyright © 2015 nickTD. All rights reserved.
//

import Quick
import Nimble

@testable
import SwiftDailyAPI

class Xcode7PlusSwift2: QuickSpec {
  override func spec() {
    describe("Xcode7 + Swift 2") {
      it("is AWESOME!") {
        Daily(date: NSDate(), news: [])
      }
    }
  }
}
