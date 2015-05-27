//
//  NSDate+String.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 27/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Foundation

extension NSDate {
    public class func dateFromString(string: String, format: String) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(string)
    }
}
