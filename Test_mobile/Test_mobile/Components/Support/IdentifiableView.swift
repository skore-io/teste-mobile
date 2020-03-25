protocol IdentifiableView: AnyObject { }

extension IdentifiableView {
    static var identifier: String {
        return String(describing: self)
    }
}
