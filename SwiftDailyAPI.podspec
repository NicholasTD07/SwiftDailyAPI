Pod::Spec.new do |s|
  s.name         = "SwiftDailyAPI"
  s.version      = "2.0.1"
  s.summary      = "A Swift API framework for ZhiHu's Daily News."
  s.description  = <<-DESC
  SwiftDailyAPI provides a simple API for ZhiHu's Daily News in Swift by using Alamofire and Argo for network request and JSON decoding.
                   DESC
  s.homepage     = "https://github.com/NicholasTD07/SwiftDailyAPI"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Nicholas T." => "Nicholas.TD07@gmail.com" }
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/NicholasTD07/SwiftDailyAPI.git", :tag => s.version }
  s.source_files  = "SwiftDailyAPI/", "SwiftDailyAPI/**/*.{swift}"
  s.requires_arc = true
  s.dependency 'Argo', '~> 2.2.0'
  s.dependency 'Alamofire', '~> 3.0'
end
