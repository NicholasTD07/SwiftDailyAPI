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
  public let imageURL: NSURL
}

extension TopNewsMeta: Decodable {
  private static func create(newsId: Int)(title: String)(imageURL: NSURL) -> TopNewsMeta {
    return TopNewsMeta(newsId: newsId, title: title, imageURL: imageURL)
  }

  public static func decode(j: JSON) -> Decoded<TopNewsMeta> {
    return TopNewsMeta.create
      <^> j <| "id"
      <*> j <| "title"
      <*> j <| "image"
  }
}
