//
//  PerformanceTests.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 1/06/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import XCTest
import SwiftDailyAPI
import Argo

class DecodingPerformanceTests: XCTestCase {
  func testDecodingDaily() {
    measureDecodingModel(Daily.self, fromFile: "daily_news_20150525")
  }

  func testDecodingLatestDaily() {
    measureDecodingModel(LatestDaily.self, fromFile: "latest_daily_news_20150527")
  }

  func testDecodingNews() {
    measureDecodingModel(News.self, fromFile: "news_4770416")
  }

  func testDecodingNewsExtra() {
    measureDecodingModel(NewsExtra.self, fromFile: "news_extra_4770416")
  }

  func testDecodingShortComments() {
    measureDecodingModel(Comments.self, fromFile: "short_comments_4772308")
  }

  func testDecodingLongComments() {
    measureDecodingModel(Comments.self, fromFile: "long_comments_4772308")
  }

  func measureDecodingModel<T: Decodable where T == T.DecodedType>(type: T.Type, fromFile file: String) {
    let json: AnyObject = JSONFileReader.JSON(fromFile: file)!

    measureBlock {
      let model: T? = T.decode(JSON.parse(json)).value
      assert(model != nil)
    }
  }
}
