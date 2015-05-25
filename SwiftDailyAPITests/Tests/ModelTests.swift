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

    let newsId = 12345
    let title = "Title of the News"
    let imageUrlString = "http://httpbin.org/image/jpeg"

    func testDecodingNewsMeta() {
        let newsMeta: NewsMeta? = JSONFileReader.JSON(fromFile: "news_meta") >>- decode

        XCTAssert(newsMeta != nil)
        XCTAssert(newsMeta?.newsId == newsId)
        XCTAssert(newsMeta?.title == title)
        XCTAssert(newsMeta?.imageUrlStrings.count == 1)
        XCTAssert(newsMeta?.imageUrlStrings[0] == imageUrlString)
    }

    func testDecodingTopNewsMeta() {
        let topNewsMeta: TopNewsMeta? = JSONFileReader.JSON(fromFile: "top_news_meta") >>- decode

        XCTAssert(topNewsMeta != nil)
        XCTAssert(topNewsMeta?.newsId == newsId)
        XCTAssert(topNewsMeta?.title == title)
        XCTAssert(topNewsMeta?.imageUrlString == imageUrlString)
    }
}
