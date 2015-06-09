//
//  Types.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 9/06/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Foundation

public protocol DailyType {
  var date: NSDate { get }
  var news: [NewsMeta] { get }
}

public protocol LatestDailyType: DailyType {
  var topNews: [TopNewsMeta] { get }
}

public typealias LatestDailyHandler = (LatestDailyType) -> Void
public typealias DailyHandler = (DailyType) -> Void
public typealias NewsHandler = (News) -> Void
