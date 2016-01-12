//
//  objectFromFile.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 12/01/2016.
//  Copyright © 2016 nickTD. All rights reserved.
//

import Foundation
import Argo

func objectFromFile<T: Decodable where T == T.DecodedType>(filename: String) -> T? {
  let value = JSON.parse(JSONFileReader.JSON(fromFile: filename)!)

  return T.decode(value).value
}
