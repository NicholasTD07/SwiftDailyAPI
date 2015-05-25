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
        assertNewsMeta(newsMeta!, hasNewsId: newsId, title: title, imageUrlStrings: [imageUrlString])
    }

    func testDecodingTopNewsMeta() {
        let topNewsMeta: TopNewsMeta? = JSONFileReader.JSON(fromFile: "top_news_meta") >>- decode

        XCTAssert(topNewsMeta != nil)
        assertTopNewsMeta(topNewsMeta!, hasNewsId: newsId, title: title, immageUrlString: imageUrlString)
    }

    func testDecodingDailyNews() {
        let dailyNews: DailyNews? = JSONFileReader.JSON(fromFile: "news_20150525") >>- decode

        XCTAssert(dailyNews != nil)
        XCTAssert(dailyNews?.dateString == "20150525")
        XCTAssert(dailyNews?.news.count == 1)
        if let news = dailyNews?.news {
            assertNewsMeta(news[0], hasNewsId: newsId, title: title, imageUrlStrings: [imageUrlString])
        }
    }

    func assertNewsMeta(newsMeta: NewsMeta, hasNewsId newsId: Int, title: String, imageUrlStrings: [String]) {
        XCTAssert(newsMeta.newsId == newsId)
        XCTAssert(newsMeta.title == title)
        XCTAssert(newsMeta.imageUrlStrings == imageUrlStrings)
    }

    func assertTopNewsMeta(topNewsMeta: TopNewsMeta, hasNewsId newsId: Int, title: String, immageUrlString: String) {
        XCTAssert(topNewsMeta.newsId == newsId)
        XCTAssert(topNewsMeta.title == title)
        XCTAssert(topNewsMeta.imageUrlString == imageUrlString)
    }
}
