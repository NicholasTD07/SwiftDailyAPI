//
//  TopNewsMeta.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 25/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Foundation
import Argo
import Runes

public struct TopNewsMeta {
  public let newsId: Int
  public let title: String
  public let imageUrlString: String

  public init(newsId: Int, title: String, imageUrlString: String) {
    self.newsId = newsId
    self.title = title
    self.imageUrlString = imageUrlString
  }
}

extension TopNewsMeta: Decodable {
  static func create(newsId: Int)(title: String)(imageUrlString: String) -> TopNewsMeta {
    return TopNewsMeta(newsId: newsId, title: title, imageUrlString: imageUrlString)
  }

  public static func decode(j: JSON) -> Decoded<TopNewsMeta> {
    return TopNewsMeta.create
      <^> j <| "id"
      <*> j <| "title"
      <*> j <| "image"
  }
}
