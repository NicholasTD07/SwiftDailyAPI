//
//  NSURL+Decodable.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 31/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Foundation
import Argo

extension NSURL: Decodable {
  public static func decode(j: JSON) -> Decoded<NSURL> {
    switch(j) {
    case let .String(s): return .fromOptional(NSURL(string: s))
    default: return .Failure(.TypeMismatch(expected: "NSURL", actual: "\(j)"))
    }
  }
}
