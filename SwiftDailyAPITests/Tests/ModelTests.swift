//
//  ModelTests.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 25/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import XCTest
import SwiftDailyAPI
import Argo
import Runes

class ModelTests: XCTestCase {

    func testDecodingNewsMeta() {
        let newsMeta: NewsMeta? = JSONFileReader.JSON(fromFile: "news_meta") >>- decode

        XCTAssert(newsMeta != nil)
        XCTAssert(newsMeta?.newsId == 12345)
        XCTAssert(newsMeta?.title == "Title of the News")
        XCTAssert(newsMeta?.imageUrlStrings.count == 1)
        XCTAssert(newsMeta?.imageUrlStrings[0] == "http://httpbin.org/image/jpeg")
    }
}
