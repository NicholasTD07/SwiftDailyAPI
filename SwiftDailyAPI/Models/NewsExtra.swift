//
//  NewsExtra.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 31/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Foundation
import Argo
import Runes

public struct NewsExtra {
  public let popularity: Int
  public let shortComments: Int
  public let longComments: Int
  public let comments: Int
}

extension NewsExtra: Decodable {
  public static func create(popularity: Int)(shortComments: Int)(longComments: Int)(comments: Int) -> NewsExtra {
    return NewsExtra(popularity: popularity, shortComments: shortComments, longComments: longComments, comments: comments)
  }

  public static func decode(j: JSON) -> Decoded<NewsExtra> {
    return NewsExtra.create
      <^> j <| "popularity"
      <*> j <| "short_comments"
      <*> j <| "long_comments"
      <*> j <| "comments"
  }
}
