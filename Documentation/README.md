# SwiftDailyAPI [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

An API framework for ZhiHu's Daily News, built in Swift.

## Installation

### [Carthage]

[Carthage]: https://github.com/Carthage/Carthage

Add the following to your Cartfile:

```
github "NicholasTD07/SwiftDailyAPI"
```

Then run `carthage update`.

Follow the current instructions in [Carthage's README][carthage-installation]
for up to date installation instructions.

[carthage-installation]: https://github.com/Carthage/Carthage#adding-frameworks-to-an-application

## Usage

```swift
import SwiftDailyAPI

// Setup
var latestDaily: LatestDaily?
var daily: Daily?
var news: News?
var newsExtra: NewsExtra?
var shortComments, longComments: Comments?

// Given
let newsId = 4772308
let date = NSDate.dateFromString("20150525", format: DailyConstants.dateFormat)!
let api = DailyAPI(userAgent: "SwiftDailyAPI_ReadMe")

// When
api.latestDaily { latestDailyFromAPI in
  latestDaily = latestDailyFromAPI
  println(latestDaily?.news)
  println(latestDaily?.topNews)
}

api.daily(forDate: date) { dailyFromAPI in
  daily = dailyFromAPI
  println(daily?.news)
}

api.news(newsId) { newsFromAPI in
  news = newsFromAPI
  println(news?.newsId)
  println(news?.title)
}

api.newsExtra(newsId) { newsExtraFromAPI in
  newsExtra = newsExtraFromAPI
  println(newsExtra?.popularity)
  println(newsExtra?.comments)
}

api.comments(newsId, shortCommentsHandler: { comments in
  shortComments = comments
  println(shortComments?.comments)
  }, longCommentsHandler: { comments in
    longComments = comments
    println(longComments?.comments)
})
```

This code is tested in [ReadmeCodeSpecs.swift](./SwiftDailyAPITests/Specs/ReadmeCodeSpecs.swift). There's also a `When` part in the spec which expects all the vars in the `Setup` to be not nil.

## Frameworks

* [Alamofire] - Elegant HTTP networking
* [Argo]      - Functional JSON parsing
* [Quick]     - Testing
* [Nimble]    - Matcher

[Alamofire]: https://github.com/Alamofire/Alamofire
[Argo]: https://github.com/thoughtbot/Argo
[Quick]: https://github.com/Quick/Quick
[Nimble]: https://github.com/Quick/Nimble
