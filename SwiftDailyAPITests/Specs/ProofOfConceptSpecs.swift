//
//  ProofOfConceptSpecs.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 10/06/2015.
//  Copyright © 2015 nickTD. All rights reserved.
//

import Quick
import Nimble

class TestClass { init() { } }
class SubTestClass : TestClass { }
class OtherClass { init() {} }

class ProofOfConceptSpecs: QuickSpec {
  override func spec() {
    describe("array") {
      it("can contain super class and sub class") {
        var array = [TestClass]()
        array.append(TestClass())
        array.append(SubTestClass())

        // Swift 2.0, Xcode 7.0 beta
        // Cannot invoke 'append' with an argument list of type '(OtherClass)'
        // array.append(OtherClass())
      }
    }
  }
}
