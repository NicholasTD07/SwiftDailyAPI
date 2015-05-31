//
//  LatestDaily.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 25/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Foundation
import Argo
import Runes

public struct LatestDaily {
  public let date: NSDate
  public let news: [NewsMeta]
  public let topNews: [TopNewsMeta]

  public init(dateString: String, news: [NewsMeta], topNews: [TopNewsMeta]) {
    self.date = NSDate.dateFromString(dateString, format: DailyConstants.dateFormat)!
    self.news = news
    self.topNews = topNews
  }
}

extension LatestDaily: Decodable {
  private static func create(dateString: String)(news: [NewsMeta])(topNews: [TopNewsMeta]) -> LatestDaily {
    return LatestDaily(dateString: dateString, news: news, topNews: topNews)
  }

  public static func decode(j: JSON) -> Decoded<LatestDaily> {
    return LatestDaily.create
      <^> j <| "date"
      <*> j <|| "stories"
      <*> j <|| "top_stories"
  }
}
