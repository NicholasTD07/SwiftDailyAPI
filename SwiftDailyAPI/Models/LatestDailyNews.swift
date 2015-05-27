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
    public let dateString: String
    public let news: [NewsMeta]
    public let topNews: [TopNewsMeta]

    public init(dateString: String, news: [NewsMeta], topNews: [TopNewsMeta]) {
        self.dateString = dateString
        self.news = news
        self.topNews = topNews
    }
}

extension LatestDailyNews: Decodable {
    static func create(dateString: String)(news: [NewsMeta])(topNews: [TopNewsMeta]) -> LatestDailyNews {
        return LatestDailyNews(dateString: dateString, news: news, topNews: topNews)
    }

    public static func decode(j: JSON) -> Decoded<LatestDailyNews> {
        return LatestDailyNews.create
            <^> j <| "date"
            <*> j <|| "stories"
            <*> j <|| "top_stories"
    }
}

extension LatestDailyNews: Equatable { }

public func ==(rhs: LatestDailyNews, lhs: LatestDailyNews) -> Bool {
    return rhs.dateString == lhs.dateString
        && rhs.news == lhs.news
        && rhs.topNews == lhs.topNews
}
