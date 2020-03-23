import UIKit

extension Int64 {
    var toDateString: String {
        let timeInterval = TimeInterval(integerLiteral: self)
        let date = Date(timeIntervalSince1970: timeInterval)

        return date.formatted
    }
}
