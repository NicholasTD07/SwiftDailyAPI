# SwiftDailyAPI 

[![Build Status](https://travis-ci.org/NicholasTD07/SwiftDailyAPI.svg?branch=develop)](https://travis-ci.org/NicholasTD07/SwiftDailyAPI)
[![codecov.io](https://codecov.io/github/NicholasTD07/SwiftDailyAPI/coverage.svg?branch=develop)](https://codecov.io/github/NicholasTD07/SwiftDailyAPI?branch=develop)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SwiftDailyAPI.svg)](https://img.shields.io/cocoapods/v/SwiftDailyAPI.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

An API framework for ZhiHu's Daily News, built in Swift.

## Requirement

* iOS 8.0+ / Mac OS X 10.9+
* Xcode 7.2 +

## Installation

> **Embedded frameworks require a minimum deployment target of iOS 8 or OS X Mavericks (10.9).**

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 0.39.0+ is required to build SwiftDailyAPI 2.0.0+.

To integrate SwiftDailyAPI into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!

pod 'SwiftDailyAPI', '~> 2.0'
```

Then, run the following command:

```bash
$ pod install
```
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

## Appendix

### How does SwiftDailyAPI support both Carthage and CocoaPods while having 3rd parity dependencies?

Well, it works like this. Before 2.0.1, I was using Carthage to manage
dependencies so Carthage works for version 2.0.0. However, I switched to
CocoaPods since 2.0.1 because it's easier to setup, more stable from my
experience, also takes less time to install dependencies (Carthage has one extra
build step) and Travis has caching for CocoaPods.

[Alamofire]: https://github.com/Alamofire/Alamofire
[Argo]: https://github.com/thoughtbot/Argo
[Quick]: https://github.com/Quick/Quick
[Nimble]: https://github.com/Quick/Nimble
