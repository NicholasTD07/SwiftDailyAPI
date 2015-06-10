//
//  DailyInMemoryStore.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 9/06/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Quick
import Nimble

@testable
import SwiftDailyAPI
class DailyInMemoryStoreSpecs: QuickSpec {
  override func spec() {
    describe("when there's something in store") {
      it("loads data from its own cache") {
        let store = DailyInMemoryStore()

        let newsId = 4791630
        let date = NSDate.dateFromString("20150525", format: DailyConstants.dateFormat)!

        var daily: DailyType?
        var news: News?

        store.dailies[date] = Daily(date: date, news: [])
        store.news[newsId] = News(newsId: 0, title: "", body: "", cssURLs: [], imageURL: NSURL(string: "")!, imageSourceText: "", shareURL: NSURL(string: "")!)

        store.daily(forDate: date) { dailyFromAPI in
          daily = dailyFromAPI
        }

        store.news(newsId) { newsFromAPI in
          news = newsFromAPI
        }

        expect(daily).toNot(beNil())
        expect(news).toNot(beNil())
      }
    }

    describe("when there's nothing in store") {
      it("loads data from API") {
        let store = DailyInMemoryStore()

        var latestDaily: LatestDailyType?
        var daily: DailyType?
        var news: News?

        store.latestDaily { latest in
          latestDaily = latest
        }

        let date = NSDate.dateFromString("20150525", format: DailyConstants.dateFormat)!
        store.daily(forDate: date) { dailyFromAPI in
          daily = dailyFromAPI
        }

        store.news(4791630) { newsFromAPI in
          news = newsFromAPI
        }

        expect(latestDaily).toEventuallyNot(beNil(), timeout: 10)
        expect(daily).toEventuallyNot(beNil(), timeout: 10)
        expect(news).toEventuallyNot(beNil(), timeout: 10)
      }
    }
  }
}
