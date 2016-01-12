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

class RealDataModelDecodeSpecs: QuickSpec {


  override func spec() {
    it("decodes Daily") {
      let daily: Daily? = objectFromFile("daily_news_20150525")

      expect(daily).toNot(beNil())
      expect(daily!.date).to(equal(NSDate.dateFromString("20150525", format: "yyyyMMdd")))
      expect(daily!.news).toNot(beEmpty())
    }

    it("decodes LatestDaily") {
      let latestDaily: LatestDaily? =  objectFromFile("latest_daily_news_20150527")

      expect(latestDaily).toNot(beNil())
      expect(latestDaily!.date).to(equal(NSDate.dateFromString("20150527", format: "yyyyMMdd")))
      expect(latestDaily!.news).toNot(beEmpty())
      expect(latestDaily!.topNews).toNot(beEmpty())
    }

    it("decodes LatestDaily with a themed NewsMeta") {
      let latestDaily: LatestDaily? = objectFromFile("latest_daily_news_20150802")

      expect(latestDaily).toNot(beNil())
      expect(latestDaily!.date).toNot(beNil())
      expect(latestDaily!.news).toNot(beEmpty())
      expect(latestDaily!.topNews).toNot(beEmpty())
    }

    let decodesNews: (News?) -> Void = { (news: News?) in
      expect(news).toNot(beNil())

      expect(news!.newsId).toNot(beNil())
      expect(news!.body).toNot(beNil())

      expect(news!.title).toNot(beNil())
      expect(news!.cssURLs).toNot(beEmpty())
      expect(news!.shareURL).toNot(beNil())
    }

    it("decodes News") {
      let news: News? = objectFromFile("news_4770416")

      decodesNews(news)
      expect(news!.imageURL).toNot(beNil())
      expect(news!.imageSourceText).toNot(beNil())
    }

    it("decodes News without image_source") {
        let news: News? = objectFromFile("news_4859444")

        decodesNews(news)
    }

    it("decodes News without image and image_source") {
      let news: News? = objectFromFile("news_4820022")

      decodesNews(news)
    }

    it("decodes NewsExtra") {
      let newsExtra: NewsExtra? = objectFromFile("news_extra_4770416")

      expect(newsExtra).toNot(beNil())
      expect(newsExtra!.popularity).to(equal(697))
      expect(newsExtra!.shortComments).to(equal(10))
      expect(newsExtra!.longComments).to(equal(0))
      expect(newsExtra!.comments).to(equal(10))
    }

    it("decodes Comment - short") {
      let comments: Comments? = objectFromFile("short_comments_4772308")

      expect(comments!.comments).toNot(beEmpty())
    }

    it("decodes Comment - long") {
      let comments: Comments? = objectFromFile("long_comments_4772308")

      expect(comments!.comments).toNot(beEmpty())
    }
  }
}
