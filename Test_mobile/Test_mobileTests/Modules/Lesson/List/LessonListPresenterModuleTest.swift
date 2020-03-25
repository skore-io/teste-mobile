import XCTest

@testable import Test_mobile

class LessonListPresenterModuleTest: XCTestCase {
    var sut: (LessonListPresentable & LessonListShowScreen & RemovableLesson & AlertActionHandle)?
    var mockView: LessonListViewMock?
    var mockInteractor: LessonListInteractorMock?
    var mockRouter: LessonListRouterMock?

    override func setUp() {
        self.initializer()

        super.setUp()
    }

    private func initializer() {
        self.mockView = LessonListViewMock()
        self.mockInteractor = LessonListInteractorMock()
        self.mockRouter = LessonListRouterMock()

        guard
            let view = self.mockView,
            let interactor = self.mockInteractor,
            let router = self.mockRouter else {
                return
        }

        sut = LessonListPresenter(view: view,
                                  interactor: interactor,
                                  router: router)
    }

    override func tearDown() {
        self.sut = nil
        self.mockView = nil
        self.mockInteractor = nil
        self.mockRouter = nil

        super.tearDown()
    }

    func testViewWillAppear() {
        self.sut?.viewWillAppear()
        XCTAssert(self.mockInteractor?.callsToAvailableRetrieveLessonList == 1)
    }

    func testDidRetrieveLessonList() {
        self.sut?.didRetrieveLessonList(MockLessonList.generate())
        XCTAssert(self.mockView?.callsToAvailableUpdateScreen == 1)
    }

    func testDidFailedToReceiverLessonList() {
        self.sut?.didFailedToReceiverLessonList(nil)
        XCTAssert(self.mockRouter?.callsToAvailableShowAlert == 1)
    }

    func testRemoveLesson() {
        self.sut?.removeLesson("")
        XCTAssert(self.mockRouter?.callsToAvailableShowAlert == 1)
    }

    func testHasComplementAction() {
        self.sut?.didRetrieveLessonList(MockLessonList.generate())
        self.sut?.hasComplementAction(true, data: "1234567890")
        XCTAssert(self.mockInteractor?.callsToAvailableRemoveSpecificLesson == 1)
    }
}
