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

/// Notes:
///  * Do keep a reference to any instance of `DailyAPI`, otherwise URLRequest will be canceled.
///  * All `completionHandlers` will be called on `NSThread.mainThread()`. This is guaranteed by the execution of Alamofire's `Request` callback .
public final class DailyAPI {
  private let manager: Manager

  private enum DailyRouter: URLRequestConvertible {
    static let baseURLString = "http://news.at.zhihu.com/api/4"

    case LastestDaily
    case Daily(forDate: NSDate)
    case News(newsId: Int)
    case NewsExtra(newsId: Int)
    case ShortComments(newsId: Int)
    case LongComments(newsId: Int)

    var path: String {
      switch self {
      case .LastestDaily:
        return "/news/latest"
      case .Daily(let date):
        let dateString = date.dayBefore().toString(format: "yyyyMMdd")
        return "/news/before/\(dateString)"
      case .News(let newsId):
        return "/news/\(newsId)"
      case .NewsExtra(let newsId):
        return "/news-extra/\(newsId)"
      case .ShortComments(let newsId):
        return "/news/\(newsId)/short-comments"
      case .LongComments(let newsId):
        return "/news/\(newsId)/long-comments"
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

      - parameter configuration: The configuration used to construct the underlying NSURLSession.
      - parameter userAgent:     The "User-Agent" header. Defaults to "SwiftDailyAPI/:version"

      - returns: A new DailyAPI.
  */
  public init(configuration: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration(), userAgent: String = "SwiftDailyAPI/\(SwiftDailyAPIVersionNumber)") {
    configuration.HTTPAdditionalHeaders = ["User-Agent": userAgent]
    self.manager = Manager(configuration: configuration)
  }

  /**
      Creates a `Alamofire.Request` to fetch the `LatestDaily`. Once the request has finished then the JSON will be decoded and it will call the completionHandler with the deceded object.

      - parameter completionHandler: A closure to be executed once the request has finished and the response JSON has been decoded. The closure takes one argument: the optional decoded object.

      - returns: The request.
  */
  public final func latestDaily(completionHandler: (LatestDaily?) -> Void) -> Request {
    return request(DailyRouter.LastestDaily, completionHandler: completionHandler)
  }

  /**
      Creates a `Alamofire.Request` to fetch the `Daily` at given date. Once the request has finished then the JSON will be decoded and it will call the completionHandler with the deceded object.

      - parameter date:              The date when the `Daily` is published.
      - parameter completionHandler: A closure to be executed once the request has finished and the response JSON has been decoded. The closure takes one argument: the optional decoded object.

      - returns: The request.
  */
  public final func daily(forDate date: NSDate, completionHandler: (Daily?) -> Void) -> Request {
    return request(DailyRouter.Daily(forDate: date), completionHandler: completionHandler)
  }

  /**
      Creates a `Alamofire.Request` to fetch the `News` with given `newsId`. Once the request has finished then the JSON will be decoded and it will call the completionHandler with the deceded object.

      - parameter newsId:            The indentifier key for the `News`.
      - parameter completionHandler: A closure to be executed once the request has finished and the response JSON has been decoded. The closure takes one argument: the optional decoded object.

      - returns: The request.
  */
  public final func news(newsId: Int, completionHandler: (News?) -> Void) -> Request {
    return request(DailyRouter.News(newsId: newsId), completionHandler: completionHandler)
  }

  /**
      Creates a `Alamofire.Request` to fetch the `NewsExtra` with given `newsId`. Once the request has finished then the JSON will be decoded and it will call the completionHandler with the deceded object.

      - parameter newsId:            The indentifier key for the `NewsExtra`.
      - parameter completionHandler: A closure to be executed once the request has finished and the response JSON has been decoded. The closure takes one argument: the optional decoded object.

      - returns: The request.
  */
  public final func newsExtra(newsId: Int, completionHandler: (NewsExtra?) -> Void) -> Request {
    return request(DailyRouter.NewsExtra(newsId: newsId), completionHandler: completionHandler)
  }

  /**
      Creates a `Alamofire.Request` to fetch the short `Comments` with given `newsId`. Once the request has finished then the JSON will be decoded and it will call the completionHandler with the deceded object.

      - parameter newsId:            The indentifier key for the short `Comments`.
      - parameter completionHandler: A closure to be executed once the request has finished and the response JSON has been decoded. The closure takes one argument: the optional decoded object.

      - returns: The request.
  */
  public final func shortComments(newsId: Int, commentsHandler: (Comments?) -> Void) -> Request {
    return request(DailyRouter.ShortComments(newsId: newsId), completionHandler: commentsHandler)
  }

  /**
  Creates a `Alamofire.Request` to fetch the long `Comments` with given `newsId`. Once the request has finished then the JSON will be decoded and it will call the completionHandler with the deceded object.

  - parameter newsId:            The indentifier key for the long `Comments`.
  - parameter completionHandler: A closure to be executed once the request has finished and the response JSON has been decoded. The closure takes one argument: the optional decoded object.

  - returns: The request.
  */
  public final func longComments(newsId: Int, commentsHandler: (Comments?) -> Void) -> Request {
    return request(DailyRouter.LongComments(newsId: newsId), completionHandler: commentsHandler)
  }

  /**
  Creates a `Alamofire.Request` to fetch all the `Comments` with given `newsId`. Once the request has finished then the JSON will be decoded and it will call the completionHandler with the deceded object.

  - parameter newsId:            The indentifier key for the `Comments`.
  - parameter completionHandler: A closure to be executed once the request has finished and the response JSON has been decoded. The closure takes one argument: the optional decoded object.

  - returns: The request.
  */
  public final func comments(newsId: Int, shortCommentsHandler: (Comments?) -> Void, longCommentsHandler: (Comments?) -> Void) -> (shortCommentsRequest: Request, longCommentsRequest: Request) {
    let shortCommentsRequest = request(DailyRouter.ShortComments(newsId: newsId), completionHandler: shortCommentsHandler)
    let longCommentsRequest = request(DailyRouter.LongComments(newsId: newsId), completionHandler: longCommentsHandler)
    return (shortCommentsRequest: shortCommentsRequest, longCommentsRequest: longCommentsRequest)
  }

  private final func request<T: Decodable where T == T.DecodedType>(URLRequest: URLRequestConvertible, completionHandler: T? -> Void) -> Request {
    return manager.request(URLRequest)
                  .responseJSON { (request, response, JSON, error) in
                    completionHandler(JSON >>- decode)
                  }
  }
}
