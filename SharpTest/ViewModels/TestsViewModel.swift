final class TestsViewModel {
    
    //MARK: - Properties
    
    private let provider: TestProvider
    
    let testResultsRepository: TestResultsRepository
    
    private var allTests: [Test] = []
    
    private(set) var selectedTopic: String?
    
    var topics: [String] {
        Array(Set(allTests.map { $0.topic })).sorted()
    }
    
    private var filteredTests: [Test] {
        guard let selectedTopic else { return allTests }
        return allTests.filter { $0.topic == selectedTopic }
    }
    
    var testsCount: Int {
        filteredTests.count
    }
    
    var lastResultText: String {
        guard let result = testResultsRepository.lastResult() else {
            return "Нет результатов"
        }
        
        return "\(result.testTitle) • \(result.score) / \(result.totalQuestions)"
    }
    
    //MARK: - Init
    
    init(
        provider: TestProvider,
        testResultsRepository: TestResultsRepository
    ) {
        self.provider = provider
        self.testResultsRepository = testResultsRepository
        allTests = provider.loadTests()
    }
    
    //MARK: - Public methods
    
    func test(at index: Int) -> Test {
        filteredTests[index]
    }
    
    func selectTopic(_ topic: String?) {
        selectedTopic = topic
    }
    
}
