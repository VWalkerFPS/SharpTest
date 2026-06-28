import Foundation

struct TestResult: Codable {
    let id: UUID
    let testId: String
    let testTitle: String
    let topic: String
    let score: Int
    let totalQuestions: Int
    let completedAt: Date
}
