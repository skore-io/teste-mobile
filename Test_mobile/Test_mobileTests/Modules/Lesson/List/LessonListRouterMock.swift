import XCTest

@testable import Test_mobile

class LessonListRouterMock: LessonListRoutable {
    var callsToAvailableCreateModule: Int = 0
    var callsToAvailableShowAlert: Int = 0

    func createModule() -> UIViewController {
        self.callsToAvailableCreateModule += 1

        return UIViewController()
    }

    func showAlert(from view: LessonListViewable?, infoAlert: FillSimpleAlert?) {
        self.callsToAvailableShowAlert += 1
    }
}
