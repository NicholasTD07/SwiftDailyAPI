//
//  ModelTests.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 25/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Quick
import Nimble
import SwiftDailyAPI
import Argo
import Runes

class ModelDecodeSpecs: QuickSpec {

  override func spec() {
    describe("real data") {
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
    }

    describe("test data") {
      let newsId = 12345
      let title = "Title of the News"
      let imageURLString = "http://httpbin.org/image/jpeg"
      let gaPrefix = 67890
      let dateString = "20150525"

      it("decodes NewsMeta") {
        let newsMeta: NewsMeta? = JSONFileReader.JSON(fromFile: "news_meta") >>- decode

        expect(newsMeta).toNot(beNil())
        expect(newsMeta!.newsId).to(equal(newsId))
        expect(newsMeta!.title).to(equal(title))

        expect(newsMeta!.imageURLs).to(equal([NSURL(string: imageURLString)!]))
        expect(newsMeta!.gaPrefix).to(equal(gaPrefix))
      }

      it("decodes TopNewsMeta") {
        let topNewsMeta: TopNewsMeta? = JSONFileReader.JSON(fromFile: "top_news_meta") >>- decode

        expect(topNewsMeta).toNot(beNil())
        expect(topNewsMeta!.newsId).to(equal(newsId))
        expect(topNewsMeta!.title).to(equal(title))

        expect(topNewsMeta!.imageURL).to(equal(NSURL(string: imageURLString)!))
      }

      it("decodes Daily") {
        let daily: Daily? = JSONFileReader.JSON(fromFile: "daily_news") >>- decode

        expect(daily).toNot(beNil())
        expect(daily!.date).to(equal(NSDate.dateFromString("20150525", format: "yyyyMMdd")))
        expect(daily!.news).toNot(beEmpty())
      }

      it("decodes Latestdaily") {
        let latestDaily: LatestDaily? = JSONFileReader.JSON(fromFile: "latest_daily_news") >>- decode

        expect(latestDaily).toNot(beNil())
        expect(latestDaily!.date).to(equal(NSDate.dateFromString("20150525", format: "yyyyMMdd")))
        expect(latestDaily!.news).toNot(beEmpty())
        expect(latestDaily!.topNews).toNot(beEmpty())
      }

      it("decodes News") {
        let news: News? = JSONFileReader.JSON(fromFile: "news") >>- decode

        expect(news).toNot(beNil())
        expect(news!.newsId).to(equal(newsId))
        expect(news!.title).to(equal(title))
        expect(news!.body).to(equal("HTML body"))
        expect(news!.cssURLs).toNot(beEmpty())
        expect(news!.imageURL).to(equal(NSURL(string: imageURLString)!))
        expect(news!.imageSourceText).to(equal("Image Source"))
        expect(news!.shareURL).to(equal(NSURL(string: "http://daily.zhihu.com/story/12345")))
      }

      it("decodes NewsExtra") {
        let newsExtra: NewsExtra? = JSONFileReader.JSON(fromFile: "news_extra") >>- decode

        expect(newsExtra).toNot(beNil())
        expect(newsExtra!.popularity).to(equal(100))
        expect(newsExtra!.shortComments).to(equal(200))
        expect(newsExtra!.longComments).to(equal(300))
        expect(newsExtra!.comments).to(equal(500))
      }
    }
  }
}
