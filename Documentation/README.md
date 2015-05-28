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

let api = DailyAPI()

api.latestDaily() { (latestDaily: LatestDailyNews?) in
    if let latestDaily = latestDaily {
        println(latestDaily.date)
        println(latestDaily.news)
        println(latestDaily.topNews)
    }
}
```

## Frameworks

* [Alamofire] - Elegant HTTP networking
* [Argo]      - Functional JSON parsing
* [Quick]     - Testing
* [Nimble]    - Matcher

[Alamofire]: https://github.com/Alamofire/Alamofire
[Argo]: https://github.com/thoughtbot/Argo
[Quick]: https://github.com/Quick/Quick
[Nimble]: https://github.com/Quick/Nimble
