import UIKit

extension Int {
    var toDateString: String {
        let timeInterval = TimeInterval(self/1000)
        let date = Date(timeIntervalSince1970: timeInterval)

        return date.formatted
    }
}
