final class ResultViewModel {
    
    private let service: QuizService
    
    let resultRepository: TestResultsRepository
    
    private var hasSavedResult = false
    
    private lazy var testResult: TestResult = service.makeResult()
    
    init(service: QuizService, resultRepository: TestResultsRepository) {
        self.service = service
        self.resultRepository = resultRepository
    }
    
    var result: TestResult {
        testResult
    }
    
    var testTitle: String {
        service.testTitle
    }
    
    var scoreText: String {
        "\(service.score) из \(service.totalQuestionsCount)"
    }
    
    var wrongAnswers: [UserAnswer] {
        service.wrongAnswers
    }
    
    var wrongAnswersCount: Int {
        wrongAnswers.count
    }
    
    var percentage: String {
        guard service.totalQuestionsCount > 0 else { return "0%" }
        let value = Double(service.score) / Double(service.totalQuestionsCount) * 100
        return "\(Int(value))%"
    }
    
    var hasMistakes: Bool {
        !wrongAnswers.isEmpty
    }
    
    func wrongAnswer(at index: Int) -> UserAnswer {
        wrongAnswers[index]
    }
    
    func saveResult() {
        guard !hasSavedResult else { return }
        
        resultRepository.save(testResult)
        hasSavedResult = true
    }
    
}
