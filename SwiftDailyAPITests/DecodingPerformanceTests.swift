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
import Runes

class DecodingPerformanceTests: XCTestCase {
  func testDecodingDaily() {
    let json: AnyObject = JSONFileReader.JSON(fromFile: "daily_news_20150525")!

    measureBlock {
      let daily: Daily? = json >>- decode
    }
  }

  func testDecodingLatestDaily() {
    let json: AnyObject = JSONFileReader.JSON(fromFile: "latest_daily_news_20150527")!

    measureBlock {
      let latestDaily: LatestDaily? = json >>- decode
    }
  }

  func testDecodingNews() {
    let json: AnyObject = JSONFileReader.JSON(fromFile: "news_4770416")!

    measureBlock {
      let news: News? = json >>- decode
    }
  }

  func testDecodingNewsExtra() {
    let json: AnyObject = JSONFileReader.JSON(fromFile: "news_extra_4770416")!

    measureBlock {
      let newsExtra: NewsExtra? = json >>- decode
    }
  }

  func testDecodingShortComments() {
    let json: AnyObject = JSONFileReader.JSON(fromFile: "short_comments_4772308")!

    measureBlock {
      let comments: Comments? = json >>- decode
    }
  }

  func testDecodingLongComments() {
    let json: AnyObject = JSONFileReader.JSON(fromFile: "long_comments_4772308")!

    measureBlock {
      let comments: Comments? = json >>- decode
    }
  }
}
