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

  public init(dateString: String, news: [NewsMeta]) {
    self.date = NSDate.dateFromString(dateString, format: DailyConstants.dateFormat)!
    self.news = news
  }
}

extension Daily: Decodable {
  private static func create(dateString: String)(news: [NewsMeta]) -> Daily {
    return Daily(dateString: dateString, news: news)
  }

  public static func decode(j: JSON) -> Decoded<Daily> {
    return Daily.create
      <^> j <| "date"
      <*> j <|| "stories"
  }
}
