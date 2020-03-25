import XCTest

@testable import Test_mobile

class LessonListViewMock: LessonListViewable {
    var presenter: (LessonListShowScreen & TableViewPresentableInterface)?

    var callsToAvailableViewWillAppear: Int = 0
    var callsToAvailableUpdateScreen: Int = 0

    init() {
        self.callsToAvailableViewWillAppear += 1

        self.presenter?.viewWillAppear()
    }

    func updateScreen() {
        self.callsToAvailableUpdateScreen += 1
    }
}
