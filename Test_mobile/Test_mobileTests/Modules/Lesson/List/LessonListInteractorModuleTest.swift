import XCTest

@testable import Test_mobile

class LessonListInteractorModuleTest: XCTestCase {
    var sut: LessonListInteractor?
    var mockPresenter: LessonListPresenterMock?
    var mockView: LessonListViewMock?
    var mockRouter: LessonListRouterMock?

    override func setUp() {
        self.initializer()

        super.setUp()
    }

    private func initializer() {
        self.sut = LessonListInteractor()
        self.mockView = LessonListViewMock()
        self.mockRouter = LessonListRouterMock()

        guard
            let interactor = self.sut,
            let view = self.mockView,
            let router = self.mockRouter else {
                return
        }

        self.mockPresenter = LessonListPresenterMock(view: view,
                                                     interactor: interactor,
                                                     router: router)

        self.sut?.presenter = self.mockPresenter
    }

    override func tearDown() {
        self.sut = nil
        self.mockView = nil
        self.mockRouter = nil
        self.mockPresenter = nil

        super.tearDown()
    }

    func testRetrieveLessonList() {
        self.sut?.retrieveLessonList()
        XCTAssert(self.mockPresenter?.callsToAvailableDidRetrieveLessonList == 1)
    }

    func testRemoveSpecificLesson() {
        self.sut?.removeSpecificLesson([], withID: "")
        XCTAssert(self.mockPresenter?.callsToAvailableDidRetrieveLessonList == 1)
    }
}
