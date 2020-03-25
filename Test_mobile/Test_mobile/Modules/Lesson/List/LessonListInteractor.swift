protocol LessonListInteractable: class {
    var presenter: (LessonListPresentable & RemovableLesson)? { get set }

    func retrieveLessonList()
    func removeSpecificLesson(_ listable: [ListableComponent], withID id: String)
}

class LessonListInteractor: LessonListInteractable {
    lazy var sectionGenerator = GenerateLesson()

    private let messageError = "Desculpe, mas não foi possível mostrar as aulas no momento."
    weak var presenter: (LessonListPresentable & RemovableLesson)?

    func retrieveLessonList() {
        let parser = JSONParser()
        let jsonFileName = "LessonList"
        do {
            let lessons: [Lesson]? = try parser.parse(jsonFileName)
            let lessonsOrdened = lessons?.sorted(by: { $0.createdAt < $1.createdAt })

            self.configureSection(lessonsOrdened)
        } catch {
            self.triggerError(self.messageError)
        }
    }

    private func configureSection(_ lessons: [Lesson]?) {
        guard let section = self.sectionGenerator.generateSection(lessons, and: self.presenter) else {
            self.triggerError(self.messageError)
            return
        }

        self.presenter?.didRetrieveLessonList([section])
    }

    func removeSpecificLesson(_ listables: [ListableComponent], withID id: String) {
        guard var lessons = self.sectionGenerator.convertLessonsFrom(listables) else {
            return
        }

        lessons.removeAll(where: { $0.id == id })

        self.configureSection(lessons)
    }

    private func triggerError(_ description: String) {
        let alert = FillSimpleAlert(title: "Erro...",
                                    description: description,
                                    titleButton: "Ok",
                                    hasCancelButton: false)

        self.presenter?.didFailedToReceiverLessonList(alert)
    }
}
