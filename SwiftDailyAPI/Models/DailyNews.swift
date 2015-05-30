//
//  DailyNews.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 25/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Foundation
import Argo
import Runes

public struct DailyNews {
  private let _dateString: String
  public let news: [NewsMeta]

  public var date: NSDate {
    return NSDate.dateFromString(_dateString, format: DailyConstants.dateFormat)!
  }
}

extension DailyNews: Decodable {
  private static func create(dateString: String)(news: [NewsMeta]) -> DailyNews {
    return DailyNews(_dateString: dateString, news: news)
  }

  public static func decode(j: JSON) -> Decoded<DailyNews> {
    return DailyNews.create
      <^> j <| "date"
      <*> j <|| "stories"
  }
}
