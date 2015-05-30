//
//  DailyAPI.swift
//  SwiftDailyAPI
//
//  Created by Nicholas Tian on 27/05/2015.
//  Copyright (c) 2015 nickTD. All rights reserved.
//

import Alamofire
import Argo
import Runes

/// Note: Do keep a reference to any instance of `DailyAPI`, otherwise URLRequest will be canceled.
public class DailyAPI {
  private let manager: Manager

  private enum DailyRouter: URLRequestConvertible {
    static let baseURLString = "http://news.at.zhihu.com/api/4"

    case LastestDaily
    case DailyNews(forDate: NSDate)
    case News(newsId: Int)

    var path: String {
      switch self {
      case .LastestDaily:
        return "/news/latest"
      case .DailyNews(let date):
        let dateString = date.dayBefore().toString(format: "yyyyMMdd")
        return "/news/before/\(dateString)"
      case .News(let newsId):
        return "/news/\(newsId)"
      }
    }

    var URLRequest: NSURLRequest {
      let URL = NSURL(string: DailyRouter.baseURLString)!
      let URLRequest = NSURLRequest(URL: URL.URLByAppendingPathComponent(path))

      return URLRequest
    }
  }

  /**
      Initialize DailyAPI with optional parameters: configuration and userAgent.

      :param: configuration The configuration used to construct the underlying NSURLSession.
      :param: userAgent     The "User-Agent" header. Defaults to "SwiftDailyAPI/:version"

      :returns: A new DailyAPI.
  */
  public init(configuration: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration(), userAgent: String = "SwiftDailyAPI/\(SwiftDailyAPIVersionNumber)") {
    configuration.HTTPAdditionalHeaders = ["User-Agent": userAgent]
    self.manager = Manager(configuration: configuration)
  }

  /**
      Creates a `Alamofire.Request` to fetch latest news. Once the request has finished then the JSON will be decoded and it will call the completionHandler with deceded object.

      :param: completionHandler A closure to be executed once the request has finished and the response JSON has been decoded. The closure takes one arguments: the decoded object or nil.

      :returns: The request.
  */
  public func latestDaily(completionHandler: (LatestDailyNews?) -> Void) -> Request {
    return manager.request(DailyRouter.LastestDaily)
                  .responseJSON { (request, response, JSON, error) in
                    completionHandler(JSON >>- decode)
                  }
  }

  public func dailyNews(forDate date: NSDate, completionHandler: (DailyNews?) -> Void) -> Request {
    return manager.request(DailyRouter.DailyNews(forDate: date))
                  .responseJSON { (request, response, JSON, error) in
                    completionHandler(JSON >>- decode)
                  }
  }

  public func news(newsId: Int, completionHandler: (News?) -> Void) -> Request {
    return manager.request(DailyRouter.News(newsId: newsId))
                  .responseJSON { (request, response, JSON, error) in
                    completionHandler(JSON >>- decode)
                  }
  }

  private final func request<T: Decodable where T == T.DecodedType>(URLRequest: URLRequestConvertible, completionHandler: T? -> Void) -> Request {
    return manager.request(URLRequest)
                  .responseJSON { (request, response, JSON, error) in
                    completionHandler(JSON >>- decode)
                  }
  }
}
