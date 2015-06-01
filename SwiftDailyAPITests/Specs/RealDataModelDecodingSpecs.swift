//
//  RealDataModelDecodingSpecs.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 1/06/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Quick
import Nimble
import SwiftDailyAPI
import Argo
import Runes

class RealDataModelDecodeSpecs: QuickSpec {

  override func spec() {
    it("decodes Daily") {
      let daily: Daily? = JSONFileReader.JSON(fromFile: "daily_news_20150525") >>- decode

      expect(daily).toNot(beNil())
      expect(daily!.date).to(equal(NSDate.dateFromString("20150525", format: "yyyyMMdd")))
      expect(daily!.news).toNot(beEmpty())
    }

    it("decodes LatestDaily") {
      let latestDaily: LatestDaily? = JSONFileReader.JSON(fromFile: "latest_daily_news_20150527") >>- decode

      expect(latestDaily).toNot(beNil())
      expect(latestDaily!.date).to(equal(NSDate.dateFromString("20150527", format: "yyyyMMdd")))
      expect(latestDaily!.news).toNot(beEmpty())
      expect(latestDaily!.topNews).toNot(beEmpty())
    }

    it("decodes News") {
      let news: News? = JSONFileReader.JSON(fromFile: "news_4770416") >>- decode

      expect(news).toNot(beNil())

      expect(news!.newsId).to(equal(4770416))
      expect(news!.body).to(contain("Victoria and Albert"))

      expect(news!.title).toNot(beNil())
      expect(news!.cssURLs).toNot(beEmpty())
      expect(news!.imageURL).toNot(beNil())
      expect(news!.imageSourceText).toNot(beNil())
      expect(news!.shareURL).toNot(beNil())
    }

    it("decodes NewsExtra") {
      let newsExtra: NewsExtra? = JSONFileReader.JSON(fromFile: "news_extra_4770416") >>- decode

      expect(newsExtra).toNot(beNil())
      expect(newsExtra!.popularity).to(equal(697))
      expect(newsExtra!.shortComments).to(equal(10))
      expect(newsExtra!.longComments).to(equal(0))
      expect(newsExtra!.comments).to(equal(10))
    }

    it("decodes Comment - short") {
      let comments: Comments? = JSONFileReader.JSON(fromFile: "short_comments_4772308") >>- decode

      expect(comments!.comments).toNot(beEmpty())
    }

    it("decodes Comment - long") {
      let comments: Comments? = JSONFileReader.JSON(fromFile: "long_comments_4772308") >>- decode

      expect(comments!.comments).toNot(beEmpty())
    }
  }
}
