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
    public let dateString: String
    public let news: [NewsMeta]

    public init(dateString: String, news: [NewsMeta]) {
        self.dateString = dateString
        self.news = news
    }
}

extension DailyNews: Decodable {
    static func create(dateString: String)(news: [NewsMeta]) -> DailyNews {
        return DailyNews(dateString: dateString, news: news)
    }

    public static func decode(j: JSON) -> Decoded<DailyNews> {
        return DailyNews.create
            <^> j <| "date"
            <*> j <|| "stories"
    }
}

extension DailyNews: Equatable { }

public func ==(rhs: DailyNews, lhs: DailyNews) -> Bool {
    return rhs.dateString == lhs.dateString && rhs.news == lhs.news
}
