//
//  DailyInMemoryStore.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 9/06/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Foundation

public class DailyInMemoryStore {
  public var latestDate: NSDate?

  private let dailyAPI = DailyAPI()
  private var dailies = [NSDate: DailyType]()
  private var news = [Int: News]()

  public init() {}

  public func latestDaily(latestDailyHandler: LatestDailyHandler?) {
    dailyAPI.latestDaily() { latestDaily in
      if let latestDaily = latestDaily {
        self.dailies[latestDaily.date] = latestDaily

        self.latestDate = latestDaily.date

        latestDailyHandler?(latestDaily)
      }
    }
  }

  public func daily(forDate date: NSDate, dailyHandler: DailyHandler?) {
    if let daily = dailies[date] {
      dailyHandler?(daily)
    } else {
      dailyFromAPI(forDate: date, dailyHandler: dailyHandler)
    }
  }

  public func news(newsId: Int, newsHandler: NewsHandler?) {
    if let news = news[newsId] {
      newsHandler?(news)
    } else {
      newsFromAPI(newsId, newsHandler: newsHandler)
    }
  }

  private func dailyFromAPI(forDate date: NSDate, dailyHandler: DailyHandler?) {
    dailyAPI.daily(forDate: date) { daily in
      if let daily = daily {
        self.dailies[date] = daily
        dailyHandler?(daily)
      }
    }
  }

  private func newsFromAPI(newsId: Int, newsHandler: NewsHandler?) {
    dailyAPI.news(newsId) { news in
      if let news = news {
        self.news[newsId] = news
        newsHandler?(news)
      }
    }
  }
}
