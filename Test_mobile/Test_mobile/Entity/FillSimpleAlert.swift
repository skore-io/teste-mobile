import Foundation

protocol AlertActionHandle {
    func hasComplementAction(_ isHandle: Bool, data: Any?)
}

struct FillSimpleAlert {
    var title: String
    var description: String
    var titleButton: String
    var hasCancelButton: Bool
    var dataHandle: Any?
    var alertActionHandle: AlertActionHandle?
}
