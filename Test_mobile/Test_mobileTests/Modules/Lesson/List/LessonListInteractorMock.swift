import XCTest

@testable import Test_mobile

class LessonListInteractorMock: LessonListInteractable {
    var callsToAvailableRetrieveLessonList: Int = 0
    var callsToAvailableRemoveSpecificLesson: Int = 0

    var presenter: (LessonListPresentable & RemovableLesson)?
    
    func retrieveLessonList() {
        self.callsToAvailableRetrieveLessonList += 1
        self.presenter?.didRetrieveLessonList(MockLessonList.generate())
    }

    func removeSpecificLesson(_ listable: [ListableComponent], withID id: String) {
        self.callsToAvailableRemoveSpecificLesson += 1
        self.presenter?.didRetrieveLessonList(MockLessonList.generate())
    }
}
