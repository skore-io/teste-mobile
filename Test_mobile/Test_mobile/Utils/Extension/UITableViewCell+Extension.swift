import UIKit

extension UITableViewCell {
    static func createCellWithId(tableView: UITableView, indexPath: IndexPath, identifier: String) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }

    static func createHeaderFooterCell<T>(tableView: UITableView, identifier: String) -> T? where T: UITableViewHeaderFooterView {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T
    }

    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    @objc class var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}
