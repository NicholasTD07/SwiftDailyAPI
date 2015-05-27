//
//  ModelTests.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 25/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Quick
import Nimble
import SwiftDailyAPI
import Argo
import Runes

class ModelDecodeSpecs: QuickSpec {
    override func spec() {
        it("decodes NewsMeta") {
            let newsMeta: NewsMeta? = JSONFileReader.JSON(fromFile: "news_meta") >>- decode

            expect(newsMeta).to(equal(ExpectedModels.newsMeta))
        }

        it("decodes TopNewsMeta") {
            let topNewsMeta: TopNewsMeta? = JSONFileReader.JSON(fromFile: "top_news_meta") >>- decode

            expect(topNewsMeta).to(equal(ExpectedModels.topNewsMeta))
        }

        it("decodes DailyNews") {
            let dailyNews: DailyNews? = JSONFileReader.JSON(fromFile: "news_20150525") >>- decode

            expect(dailyNews).to(equal(ExpectedModels.dailyNews))
        }

        it("decodes LatestDailyNews") {
            let latestDailyNews: LatestDailyNews? = JSONFileReader.JSON(fromFile: "news_latest") >>- decode

            expect(latestDailyNews).to(equal(ExpectedModels.latestDailyNews))
        }
    }
}

struct ExpectedModels {
    static let newsId = 12345
    static let title = "Title of the News"
    static let imageUrlString = "http://httpbin.org/image/jpeg"
    static let gaPrefix = "67890"
    static let dateString = "20150525"

    static var newsMeta = { return NewsMeta(newsId: newsId, title: title, imageUrlStrings: [imageUrlString], _gaPrefix: gaPrefix) }()
    static var topNewsMeta = { return TopNewsMeta(newsId: newsId, title: title, imageUrlString: imageUrlString) }()
    static var dailyNews = { return DailyNews(dateString: dateString, news: [newsMeta]) }()
    static var latestDailyNews = { return LatestDailyNews(dateString: dateString, news: [newsMeta], topNews: [topNewsMeta]) }()
}
