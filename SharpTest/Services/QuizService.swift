import Foundation

final class QuizService {
    
    private var questions: [Question] = []
    private var currentIndex: Int = 0
    
    private var userAnswers: [UserAnswer] = []
    
    let testId: String
    let testTitle: String
    let topic: String
    
    init(test: Test) {
        self.questions = test.questions
        self.testId = test.id
        self.testTitle = test.title
        self.topic = test.topic
    }
    
    var currentQuestion: Question? {
        guard currentIndex < questions.count else { return nil }
        return questions[currentIndex]
    }
    
    func submit(answerIds: [String]) -> UserAnswer {
        guard let question = currentQuestion else { fatalError("No question") }
        
        let correctIds = question.answers
            .filter { $0.isCorrect }
            .map { $0.id }
        
        let isCorrect = Set(correctIds) == Set(answerIds)
        
        let userAnswer = UserAnswer(
            question: question,
            selectedIds: answerIds,
            isCorrect: isCorrect
        )
        userAnswers.append(userAnswer)
        
        return userAnswer
    }
    
    func makeResult() -> TestResult {
        TestResult(
            id: UUID(),
            testId: testId,
            testTitle: testTitle,
            topic: topic,
            score: score,
            totalQuestions: totalQuestionsCount,
            completedAt: Date()
        )
    }
    
    func moveToNextQuestion() {
        guard currentIndex < questions.count else { return }
        currentIndex += 1
    }
    
    func reset() {
        currentIndex = 0
        userAnswers.removeAll()
    }
    
    var isFinished: Bool {
        currentIndex >= questions.count
    }
    
    var score: Int {
        userAnswers.filter { $0.isCorrect }.count
    }
    
    var totalQuestionsCount: Int {
        questions.count
    }
    
    var progress: Float {
        guard totalQuestionsCount > 0 else { return 0 }
        return Float(currentIndex) / Float(totalQuestionsCount)
    }
    
    var currentQuestionNumber: Int {
        min(currentIndex + 1, questions.count)
    }
    
    var allAnswers: [UserAnswer] {
        userAnswers
    }
    
    var wrongAnswers: [UserAnswer] {
        userAnswers.filter { !$0.isCorrect }
    }
    
}
