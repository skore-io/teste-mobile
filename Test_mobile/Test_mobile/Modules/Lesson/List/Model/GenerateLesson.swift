struct GenerateLesson {
    func generateSection(_ lessons: [Lesson]?, and removableDelegate: RemovableLesson?) -> SectionViewable? {
        guard let lessons = lessons else {
            return nil
        }

        let sectionBuilder = SectionBuilder()

        return sectionBuilder.build(header: self.generateHeader(),
                                    rows: self.generateRows(lessons, and: removableDelegate),
                                    footer: nil)
    }

    func convertLessonsFrom(_ listables: [ListableComponent]) -> [Lesson]? {
        var lessons = [Lesson]()

        for listable in listables {
            guard let lesson = listable.content?.data as? Lesson else {
                return nil
            }

            lessons.append(lesson)
        }

        return lessons
    }

    private func generateHeader() -> ListableComponent? {
        let identifier = LessonHeaderView.identifier
        let title = "Aulas"

        return ListableComponent(identifier: identifier,
                                  content: Transporter(data: title))
    }

    private func generateRows(_ lessons: [Lesson], and removableDelegate: RemovableLesson?) -> [ListableComponent]? {
        let identifier = LessonTableViewCell.identifier
        var rows = [ListableComponent]()

        for lesson in lessons {
            var lesson = lesson
            lesson.removeLessonDelegate = removableDelegate
            let row = ListableComponent(identifier: identifier,
                                         content: Transporter(data: lesson))
            rows.append(row)
        }

        return rows
    }
}
