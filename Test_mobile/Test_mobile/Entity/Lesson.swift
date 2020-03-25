struct Lesson: Codable {
    var companyID: String
    var createdAt: Int
    var name: String
    var id: String
    var status: String
    var summary: Summary
    var removeLessonDelegate: RemovableLesson?

    private enum CodingKeys: String, CodingKey {
        case name, id, status, summary
        case companyID = "company_id"
        case createdAt = "created_at"
    }
}
