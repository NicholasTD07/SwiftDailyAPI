//
//  News.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 30/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Foundation
import Argo

public struct News {
  public let newsId: Int
  public let title: String
  public let body: String
  public let cssURLs: [NSURL]
  public let imageURL: NSURL?
  public let imageSourceText: String?
  public let shareURL: NSURL
}

extension News: Decodable {
  private static func create(newsId: Int)(title: String)(body: String)(cssURLs: [NSURL])(imageURL: NSURL?)(imageSourceText: String?)(shareURL: NSURL) -> News {
    return News(newsId: newsId, title: title, body: body, cssURLs: cssURLs, imageURL: imageURL, imageSourceText: imageSourceText, shareURL: shareURL)
  }

  public static func decode(j: JSON) -> Decoded<News> {
    return News.create
      <^> j <| "id"
      <*> j <| "title"
      <*> j <| "body"
      <*> j <|| "css"
      <*> j <|? "image"
      <*> j <|? "image_source"
      <*> j <| "share_url"
  }
}
