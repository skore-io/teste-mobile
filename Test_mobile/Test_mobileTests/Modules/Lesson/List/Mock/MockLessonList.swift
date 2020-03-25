import XCTest
@testable import Test_mobile

struct MockLessonList {
    static func generate() -> [SectionViewable] {
        let lessons = retrieveLessonList()
        return [GenerateLesson().generateSection(lessons, and: nil)!]
    }

    private static func retrieveLessonList() -> [Lesson]? {
        let parser = JSONParser()
        let jsonFileName = "LessonList"
        do {
            let lessons: [Lesson]? = try parser.parse(jsonFileName)
            let lessonsOrdened = lessons?.sorted(by: { $0.createdAt < $1.createdAt })

            return lessonsOrdened
        } catch {
            return nil
        }
    }
}
