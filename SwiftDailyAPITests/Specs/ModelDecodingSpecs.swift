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
    let newsId = 12345
      let title = "Title of the News"
      let imageUrlString = "http://httpbin.org/image/jpeg"
      let gaPrefix = 67890
      let dateString = "20150525"

      it("decodes NewsMeta") {
        let newsMeta: NewsMeta? = JSONFileReader.JSON(fromFile: "news_meta") >>- decode

          expect(newsMeta).toNot(beNil())
          if let newsMeta = newsMeta {
            expect(newsMeta.newsId).to(equal(newsId))
              expect(newsMeta.title).to(equal(title))

              expect(newsMeta.imageUrlStrings).to(equal([imageUrlString]))
              expect(newsMeta.gaPrefix).to(equal(gaPrefix))
          }
      }

    it("decodes TopNewsMeta") {
      let topNewsMeta: TopNewsMeta? = JSONFileReader.JSON(fromFile: "top_news_meta") >>- decode

        expect(topNewsMeta).toNot(beNil())
        if let topNewsMeta = topNewsMeta {
          expect(topNewsMeta.newsId).to(equal(newsId))
            expect(topNewsMeta.title).to(equal(title))

            expect(topNewsMeta.imageUrlString).to(equal(imageUrlString))
        }
    }

    it("decodes DailyNews") {
      let dailyNews: DailyNews? = JSONFileReader.JSON(fromFile: "news_20150525") >>- decode

        expect(dailyNews).toNot(beNil())
        if let dailyNews = dailyNews {
          expect(dailyNews.date).to(equal(NSDate.dateFromString("20150525", format: "yyyyMMdd")))
            expect(dailyNews.news).toNot(beEmpty())
        }
    }

    it("decodes LatestDailyNews") {
      let latestDailyNews: LatestDailyNews? = JSONFileReader.JSON(fromFile: "news_latest") >>- decode

        expect(latestDailyNews).toNot(beNil())
        if let latestDailyNews = latestDailyNews {
          expect(latestDailyNews.date).to(equal(NSDate.dateFromString("20150525", format: "yyyyMMdd")))
            expect(latestDailyNews.news).toNot(beEmpty())
            expect(latestDailyNews.topNews).toNot(beEmpty())
        }
    }
  }
}
