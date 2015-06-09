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

public struct LatestDaily: LatestDailyType {
  public let date: NSDate
  public let news: [NewsMeta]
  public let topNews: [TopNewsMeta]
}

extension LatestDaily: Decodable {
  private static func create(date: NSDate)(news: [NewsMeta])(topNews: [TopNewsMeta]) -> LatestDaily {
    return LatestDaily(date: date, news: news, topNews: topNews)
  }

  public static func decode(j: JSON) -> Decoded<LatestDaily> {
    return LatestDaily.create
      <^> ((j <| "date") >>- toNSDate(DailyConstants.dateFormat))
      <*> j <|| "stories"
      <*> j <|| "top_stories"
  }
}
