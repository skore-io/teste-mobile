import UIKit

extension Date {
    var formatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateStyle = .short

        return dateFormatter.string(from: self)
    }
}
