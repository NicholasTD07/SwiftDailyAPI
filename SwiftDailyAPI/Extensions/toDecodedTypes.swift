//
//  toInt.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 31/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Foundation
import Argo

public func toNSDate(format: String)(dateString: String) -> Decoded<NSDate> {
  return .fromOptional(NSDate.dateFromString(dateString, format: format))
}

public func toInt(string: String) -> Decoded<Int> {
  return .fromOptional(string.toInt())
}
