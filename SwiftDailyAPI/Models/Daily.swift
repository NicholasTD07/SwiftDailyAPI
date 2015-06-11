//
//  Daily.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 25/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Foundation
import Argo
import Runes

public struct Daily {
  public let date: NSDate
  public let news: [NewsMeta]
}

extension Daily {
  public init(_ latestDaily: LatestDaily) {
    date = latestDaily.date
    news = latestDaily.news
  }
}

extension Daily: Decodable {
  private static func create(date: NSDate)(news: [NewsMeta]) -> Daily {
    return Daily(date: date, news: news)
  }

  public static func decode(j: JSON) -> Decoded<Daily> {
    return Daily.create
      <^> ((j <| "date") >>- toNSDate(DailyConstants.dateFormat))
      <*> j <|| "stories"
  }
}
