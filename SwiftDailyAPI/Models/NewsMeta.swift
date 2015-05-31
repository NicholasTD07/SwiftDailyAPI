//
//  NewsMeta.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 25/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Foundation
import Argo
import Runes

public struct NewsMeta {
  public let newsId: Int
  public let title: String
  public let imageURLs: [NSURL]
  public let gaPrefix: Int /// This can be used as the key to order news.

  public init(newsId: Int, title: String, imageUrlStrings: [String], gaPrefix: String) {
    self.newsId = newsId
    self.title = title
    self.imageURLs = imageUrlStrings.map { NSURL(string: $0)! }
    self.gaPrefix = gaPrefix.toInt()!
  }
}

extension NewsMeta: Decodable {
  private static func create(newsId: Int)(title: String)(imageUrlStrings: [String])(gaPrefix: String) -> NewsMeta {
    return NewsMeta(newsId: newsId, title: title, imageUrlStrings: imageUrlStrings, gaPrefix: gaPrefix)
  }

  public static func decode(j: JSON) -> Decoded<NewsMeta> {
    return NewsMeta.create
      <^> j <| "id"
      <*> j <| "title"
      <*> j <|| "images"
      <*> j <| "ga_prefix"
  }
}
