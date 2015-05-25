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
}

extension NewsMeta: Decodable {
    static func create(newsId: Int)(title: String)(imageUrlStrings: [String]) -> NewsMeta {
        return NewsMeta(newsId: newsId, title: title, imageUrlStrings: imageUrlStrings)
    }

    public static func decode(j: JSON) -> Decoded<NewsMeta> {
        return NewsMeta.create
            <^> j <| "id"
            <*> j <| "title"
            <*> j <|| "images"
    }
}