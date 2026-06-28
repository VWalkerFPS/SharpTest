final class QuizViewModel {
    
    //MARK: - Service
    
    private let service: QuizService
    
    //MARK: - Properties
    
    var testTitle: String {
        service.testTitle
    }
    
    var serviceReference: QuizService {
        service
    }
    
    var questionText: String {
        service.currentQuestion?.text ?? ""
    }
    
    var imageURL: String? {
        service.currentQuestion?.imageURL
    }
    
    var answers: [Answer] {
        service.currentQuestion?.answers ?? []
    }
    
    var allowsMultipleSelection: Bool {
        service.currentQuestion?.type == .multipleChoise
    }
    
    var currentQuestionNumber: Int {
        service.currentQuestionNumber
    }
    
    var totalQuestions: Int {
        service.totalQuestionsCount
    }
    
    var isFinished: Bool {
        service.isFinished
    }
    
    var progress: Float {
        service.progress
    }
    
    //MARK: - Init
        
    init(service: QuizService) {
        self.service = service
    }
    
    //MARK: - Public methods
    
    func submit(selectedAnswerIds: [String]) -> UserAnswer {
        service.submit(answerIds: selectedAnswerIds)
    }
    
    func nextQuestion() {
        service.moveToNextQuestion()
    }
    
}
