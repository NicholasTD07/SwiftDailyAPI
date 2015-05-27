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
    public let imageUrlStrings: [String]
    private let _gaPrefix: String

     /// This can be used as the key to order news.
    public var gaPrefix: Int { return _gaPrefix.toInt()! }

    public init(newsId: Int, title: String, imageUrlStrings: [String], _gaPrefix: String) {
        self.newsId = newsId
        self.title = title
        self.imageUrlStrings = imageUrlStrings
        self._gaPrefix = _gaPrefix
    }
}

extension NewsMeta: Decodable {
    static func create(newsId: Int)(title: String)(imageUrlStrings: [String])(gaPrefix: String) -> NewsMeta {
        return NewsMeta(newsId: newsId, title: title, imageUrlStrings: imageUrlStrings, _gaPrefix: gaPrefix)
    }

    public static func decode(j: JSON) -> Decoded<NewsMeta> {
        return NewsMeta.create
            <^> j <| "id"
            <*> j <| "title"
            <*> j <|| "images"
            <*> j <| "ga_prefix"
    }
}

extension NewsMeta: Equatable { }

public func ==(rhs: NewsMeta, lhs: NewsMeta) -> Bool {
    return rhs.newsId == lhs.newsId
        && rhs.title == lhs.title
        && rhs.imageUrlStrings == lhs.imageUrlStrings
        && rhs.gaPrefix == lhs.gaPrefix
}

extension NewsMeta: Printable {
    public var description: String {
        return "\n".join([
            "id: \(newsId)",
            "title: \(title)",
            "imageUrlStrings: \(imageUrlStrings)",
            "gaPrefix: \(gaPrefix)"
        ]) }
}
