//
//  News.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 30/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Foundation
import Argo
import Runes

public struct News {
  public let newsId: Int
  public let title: String
  public let body: String
  public let cssURLs: [NSURL]
  public let imageURL: NSURL
  public let imageSourceText: String
  public let shareURL: NSURL

  public init(newsId: Int, title: String, body: String, cssURLStrings: [String], imageURLString: String, imageSourceText: String, shareURLString: String) {
    self.newsId = newsId
    self.title = title
    self.body = body
    // TODO: Investigate ZhiHu's API, find out whether these URLStrings can be empty string or not
    self.cssURLs = cssURLStrings.map { NSURL(string: $0)! }
    self.imageURL = NSURL(string: imageURLString)!
    self.imageSourceText = imageSourceText
    self.shareURL = NSURL(string: shareURLString)!
  }
}

extension News: Decodable {
  static func create(newsId: Int)(title: String)(body: String)(cssURLStrings: [String])(imageURLString: String)(imageSourceText: String)(shareURLString: String) -> News {
    return News(newsId: newsId, title: title, body: body, cssURLStrings: cssURLStrings, imageURLString: imageURLString, imageSourceText: imageSourceText, shareURLString: shareURLString)
  }

  public static func decode(j: JSON) -> Decoded<News> {
    return News.create
      <^> j <| "id"
      <*> j <| "title"
      <*> j <| "body"
      <*> j <|| "css"
      <*> j <| "image"
      <*> j <| "image_source"
      <*> j <| "share_url"
  }
}
