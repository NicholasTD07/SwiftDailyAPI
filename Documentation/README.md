# SwiftDailyAPI

An API framework for ZhiHu's Daily News, built in Swift.

# Usage

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

* Alamofire - Network
* Argo      - JSON decoding
* Quick     - Testing
* Nimble    - Matcher