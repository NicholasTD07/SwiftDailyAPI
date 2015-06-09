import Foundation

class JSONFileReader {
  class func JSON(fromFile file: String) -> AnyObject? {
    let path = NSBundle(forClass: self).pathForResource(file, ofType: "json")

      if path != nil {
        if let data = NSData(contentsOfFile: path!) {
          do {
            return try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0))
          } catch _ {
            return nil
          }
        }
      }

    return .None
  }
}
