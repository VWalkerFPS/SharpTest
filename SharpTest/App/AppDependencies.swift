final class AppDependencies {
    
    let mockTestProvider: MockTestProvider
    
    let testResultsRepository: TestResultsRepository

    init() {
        let mockTestProvider = MockTestProvider()
        self.mockTestProvider = mockTestProvider
        
        let storage = LocalTestResultStorage()
        self.testResultsRepository = TestResultsRepository(storage: storage)
    }
    
}
