//
//  LatestDailyNews.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 25/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Foundation
import Argo
import Runes

public struct LatestDailyNews {
  private let _dateString: String
  public let news: [NewsMeta]
  public let topNews: [TopNewsMeta]

  private static let _dateFormat = "yyyyMMdd"
  public var date: NSDate {
    return NSDate.dateFromString(_dateString, format: LatestDailyNews._dateFormat)!
  }
}

extension LatestDailyNews: Decodable {
  static func create(dateString: String)(news: [NewsMeta])(topNews: [TopNewsMeta]) -> LatestDailyNews {
    return LatestDailyNews(_dateString: dateString, news: news, topNews: topNews)
  }

  public static func decode(j: JSON) -> Decoded<LatestDailyNews> {
    return LatestDailyNews.create
      <^> j <| "date"
      <*> j <|| "stories"
      <*> j <|| "top_stories"
  }
}
