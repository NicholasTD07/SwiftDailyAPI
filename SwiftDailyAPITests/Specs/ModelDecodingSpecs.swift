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
      it("decodes DailyNews") {
        let dailyNews: DailyNews? = JSONFileReader.JSON(fromFile: "daily_news_20150525") >>- decode

        expect(dailyNews).toNot(beNil())
        expect(dailyNews!.date).to(equal(NSDate.dateFromString("20150525", format: "yyyyMMdd")))
        expect(dailyNews!.news).toNot(beEmpty())
      }

      it("decodes LatestDailyNews") {
        let latestDailyNews: LatestDailyNews? = JSONFileReader.JSON(fromFile: "latest_daily_news_20150527") >>- decode

        expect(latestDailyNews).toNot(beNil())
        expect(latestDailyNews!.date).to(equal(NSDate.dateFromString("20150527", format: "yyyyMMdd")))
        expect(latestDailyNews!.news).toNot(beEmpty())
        expect(latestDailyNews!.topNews).toNot(beEmpty())
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
    }

    describe("test data") {
      let newsId = 12345
      let title = "Title of the News"
      let imageUrlString = "http://httpbin.org/image/jpeg"
      let gaPrefix = 67890
      let dateString = "20150525"

      it("decodes NewsMeta") {
        let newsMeta: NewsMeta? = JSONFileReader.JSON(fromFile: "news_meta") >>- decode

        expect(newsMeta).toNot(beNil())
        expect(newsMeta!.newsId).to(equal(newsId))
        expect(newsMeta!.title).to(equal(title))

        expect(newsMeta!.imageUrlStrings).to(equal([imageUrlString]))
        expect(newsMeta!.gaPrefix).to(equal(gaPrefix))
      }

      it("decodes TopNewsMeta") {
        let topNewsMeta: TopNewsMeta? = JSONFileReader.JSON(fromFile: "top_news_meta") >>- decode

        expect(topNewsMeta).toNot(beNil())
        expect(topNewsMeta!.newsId).to(equal(newsId))
        expect(topNewsMeta!.title).to(equal(title))

        expect(topNewsMeta!.imageUrlString).to(equal(imageUrlString))
      }

      it("decodes DailyNews") {
        let dailyNews: DailyNews? = JSONFileReader.JSON(fromFile: "daily_news") >>- decode

        expect(dailyNews).toNot(beNil())
        expect(dailyNews!.date).to(equal(NSDate.dateFromString("20150525", format: "yyyyMMdd")))
        expect(dailyNews!.news).toNot(beEmpty())
      }

      it("decodes LatestDailyNews") {
        let latestDailyNews: LatestDailyNews? = JSONFileReader.JSON(fromFile: "latest_daily_news") >>- decode

        expect(latestDailyNews).toNot(beNil())
        expect(latestDailyNews!.date).to(equal(NSDate.dateFromString("20150525", format: "yyyyMMdd")))
        expect(latestDailyNews!.news).toNot(beEmpty())
        expect(latestDailyNews!.topNews).toNot(beEmpty())
      }

      it("decodes News") {
        let news: News? = JSONFileReader.JSON(fromFile: "news") >>- decode

        expect(news).toNot(beNil())
        expect(news!.newsId).to(equal(newsId))
        expect(news!.title).to(equal(title))
        expect(news!.body).to(equal("HTML body"))
        expect(news!.cssURLs).toNot(beEmpty())
        expect(news!.imageURL).to(equal(NSURL(string: imageUrlString)!))
        expect(news!.imageSourceText).to(equal("Image Source"))
        expect(news!.shareURL).to(equal(NSURL(string: "http://daily.zhihu.com/story/12345")))
      }
    }
  }
}
