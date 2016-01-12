# SwiftDailyAPI [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

An API framework for ZhiHu's Daily News, built in Swift.

## Installation

### Minimum Requirement

* Xcode 7.2 +
* Swift 2.1 +

### [Carthage]

[Carthage]: https://github.com/Carthage/Carthage

Add the following to your Cartfile:

```
github "NicholasTD07/SwiftDailyAPI" ~> 2.0.0 # Swift 2.1
github "NicholasTD07/SwiftDailyAPI" ~> 1.0.0 # Swift 1.2
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
  print(latestDaily?.news)
  print(latestDaily?.topNews)
}

api.daily(forDate: date) { dailyFromAPI in
  daily = dailyFromAPI
  print(daily?.news)
}

api.news(newsId) { newsFromAPI in
  news = newsFromAPI
  print(news?.newsId)
  print(news?.title)
}

api.newsExtra(newsId) { newsExtraFromAPI in
  newsExtra = newsExtraFromAPI
  print(newsExtra?.popularity)
  print(newsExtra?.comments)
}

api.comments(newsId, shortCommentsHandler: { comments in
  shortComments = comments
  print(shortComments?.comments)
  }, longCommentsHandler: { comments in
    longComments = comments
    print(longComments?.comments)
})

// Then
// expect all vars in `Setup` section to not be nil
// code in `ReadmeCodeSpecs.swift`
```

This code is tested in [ReadmeCodeSpecs.swift](./SwiftDailyAPITests/Specs/ReadmeCodeSpecs.swift). There's also a `Then` part in the spec which expects all the vars in the `Setup` to not be nil.

## Frameworks

* [Alamofire] - Elegant HTTP networking
* [Argo]      - Functional JSON parsing
* [Quick]     - Testing
* [Nimble]    - Matcher

[Alamofire]: https://github.com/Alamofire/Alamofire
[Argo]: https://github.com/thoughtbot/Argo
[Quick]: https://github.com/Quick/Quick
[Nimble]: https://github.com/Quick/Nimble
