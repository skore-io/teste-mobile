import XCTest

@testable import Test_mobile

class LessonListPresenterMock: LessonListShowScreen {
    var callsToAvailableViewWillAppear: Int = 0
    var callsToAvailableDidRetrieveLessonList: Int = 0
    var callsToAvailableDidFailedToReceiverLessonList: Int = 0
    var callsToAvailableRemoveLesson: Int = 0

    var view: LessonListViewable?
    var interactor: LessonListInteractable?
    var router: LessonListRoutable?

    init(view: LessonListViewable,
         interactor: LessonListInteractor,
         router: LessonListRoutable) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewWillAppear() {
        self.callsToAvailableViewWillAppear += 1

        self.interactor?.retrieveLessonList()
    }
}

extension LessonListPresenterMock: LessonListPresentable {
    func didRetrieveLessonList(_ sections: [SectionViewable]) {
        self.callsToAvailableDidRetrieveLessonList += 1
    }
    
    func didFailedToReceiverLessonList(_ infoAlert: FillSimpleAlert?) {
        self.callsToAvailableDidFailedToReceiverLessonList += 1
    }
}

extension LessonListPresenterMock: RemovableLesson {
    func removeLesson(_ id: String) {
        self.callsToAvailableRemoveLesson += 1
        self.interactor?.removeSpecificLesson([], withID: id)
    }
}
