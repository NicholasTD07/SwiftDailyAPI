//
//  ReadmeCodeSpecs.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 4/06/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Quick
import Nimble
import SwiftDailyAPI

class ReadmeCodeSpecs: QuickSpec {
  override func spec() {
    describe("Code in README.md") {
      fit("runs") { // TODO: remove f
        // Setup
        var latestDaily: LatestDaily?
        var daily: Daily?
        var news: News?
        var newsExtra: NewsExtra?
        var shortComments, longComments: Comments?

        // Given
        let newsId = 4772308
        let date = NSDate.dateFromString("20150525", format: DailyConstants.dateFormat)!
        let api = DailyAPI(userAgent: "SwiftDailyAPI_ReadMe")

        // When
        api.latestDaily { latestDailyFromAPI in
          latestDaily = latestDailyFromAPI
          println(latestDaily?.news)
          println(latestDaily?.topNews)
        }

        api.daily(forDate: date) { dailyFromAPI in
          daily = dailyFromAPI
          println(daily?.news)
        }

        api.news(newsId) { newsFromAPI in
          news = newsFromAPI
          println(news?.newsId)
          println(news?.title)
        }

        api.newsExtra(newsId) { newsExtraFromAPI in
          newsExtra = newsExtraFromAPI
          println(newsExtra?.popularity)
          println(newsExtra?.comments)
        }

        api.comments(newsId, shortCommentsHandler: { comments in
          shortComments = comments
          println(shortComments?.comments)
          }, longCommentsHandler: { comments in
            longComments = comments
            println(longComments?.comments)
        })

        // Then
        expect(latestDaily).toEventuallyNot(beNil(), timeout: 10)
        expect(daily).toEventuallyNot(beNil(), timeout: 10)
        expect(news).toEventuallyNot(beNil(), timeout: 10)
        expect(newsExtra).toEventuallyNot(beNil(), timeout: 10)
        expect(shortComments).toEventuallyNot(beNil(), timeout: 10)
        expect(longComments).toEventuallyNot(beNil(), timeout: 10)
      }
    }
  }
}
