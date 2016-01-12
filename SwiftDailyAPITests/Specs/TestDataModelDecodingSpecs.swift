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

class TestDataModelDecodeSpecs: QuickSpec {
  override func spec() {
    let newsId = 12345
    let title = "Title of the News"
    let imageURLString = "http://httpbin.org/image/jpeg"
    let gaPrefix = 67890
    let dateString = "20150525"

    it("decodes NewsMeta") {
      let newsMeta: NewsMeta? = objectFromFile("news_meta")

      expect(newsMeta).toNot(beNil())
      expect(newsMeta!.newsId).to(equal(newsId))
      expect(newsMeta!.title).to(equal(title))

      expect(newsMeta!.imageURLs).to(equal([NSURL(string: imageURLString)!]))
      expect(newsMeta!.gaPrefix).to(equal(gaPrefix))
    }

    it("decodes TopNewsMeta") {
      let topNewsMeta: TopNewsMeta? = objectFromFile("top_news_meta")

      expect(topNewsMeta).toNot(beNil())
      expect(topNewsMeta!.newsId).to(equal(newsId))
      expect(topNewsMeta!.title).to(equal(title))

      expect(topNewsMeta!.imageURL).to(equal(NSURL(string: imageURLString)!))
    }

    it("decodes Daily") {
      let daily: Daily? = objectFromFile("daily_news")

      expect(daily).toNot(beNil())
      expect(daily!.date).to(equal(NSDate.dateFromString("20150525", format: "yyyyMMdd")))
      expect(daily!.news).toNot(beEmpty())
    }

    it("decodes Latestdaily") {
      let latestDaily: LatestDaily? = objectFromFile("latest_daily_news")

      expect(latestDaily).toNot(beNil())
      expect(latestDaily!.date).to(equal(NSDate.dateFromString("20150525", format: "yyyyMMdd")))
      expect(latestDaily!.news).toNot(beEmpty())
      expect(latestDaily!.topNews).toNot(beEmpty())
    }

    it("decodes News") {
      let news: News? = objectFromFile("news")

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
      let newsExtra: NewsExtra? = objectFromFile("news_extra")

      expect(newsExtra).toNot(beNil())
      expect(newsExtra!.popularity).to(equal(100))
      expect(newsExtra!.shortComments).to(equal(200))
      expect(newsExtra!.longComments).to(equal(300))
      expect(newsExtra!.comments).to(equal(500))
    }

    it("decodes Comment") {
      let comment: Comment? = objectFromFile("comment")

      expect(comment).toNot(beNil())
      expect(comment!.commentId).to(equal(12345))
      expect(comment!.authorName).to(equal("The Master"))
      expect(comment!.content).to(equal("How about that? I win."))
      expect(comment!.likes).to(equal(1200))
      expect(comment!.repliedAt).to(equal(NSDate(timeIntervalSince1970: 1234567890)))
      expect(comment!.avatarURL).to(equal(NSURL(string: imageURLString)!))
    }

    it("decodes Comment with ReplyToComment") {
      let comment: Comment? = objectFromFile("comment_with_reply_to")

      expect(comment).toNot(beNil())
      expect(comment!.replyToComment).toNot(beNil())
      expect(comment!.replyToComment!.authorName).to(equal("Doctor Who"))
      expect(comment!.replyToComment!.content).to(equal("Just regenerate! Regenerate!"))
    }
  }
}
