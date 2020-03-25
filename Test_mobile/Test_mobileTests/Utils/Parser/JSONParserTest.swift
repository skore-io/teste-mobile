import XCTest

@testable import Test_mobile

class JSONParserTest: XCTestCase {
    private var parser: JSONParser?

    override func setUp() {
        super.setUp()

        self.parser = JSONParser()
    }

    override func tearDown() {
        self.parser = nil

        super.tearDown()
    }

    func testParserSuccessfully() {
        do {
            let list: [Lesson]? = try self.parser?.parse("LessonList")
            let numberOfLessons = list?.count ?? 0

            XCTAssert(numberOfLessons > 0)
        } catch {
            XCTFail()
        }
    }

    func testParserFailure() {
        do {
            let _: [Lesson]? = try self.parser?.parse("Lesson")
        } catch {
            XCTFail()
        }
    }
}
