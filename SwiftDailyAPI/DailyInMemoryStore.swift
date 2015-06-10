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

  let dailyAPI = DailyAPI()
  var dailies = [NSDate: DailyType]()
  var news = [Int: News]()

  public init() {}

  public func latestDaily(latestDailyHandler: LatestDailyHandler?) {
    dailyAPI.latestDaily() { latestDaily in
      self.dailies[latestDaily.date] = latestDaily

      self.latestDate = latestDaily.date

      latestDailyHandler?(latestDaily)
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

  func dailyFromAPI(forDate date: NSDate, dailyHandler: DailyHandler?) {
    dailyAPI.daily(forDate: date) { daily in
      self.dailies[date] = daily
      dailyHandler?(daily)
    }
  }

  func newsFromAPI(newsId: Int, newsHandler: NewsHandler?) {
    dailyAPI.news(newsId) { news in
      self.news[newsId] = news
      newsHandler?(news)
    }
  }
}
