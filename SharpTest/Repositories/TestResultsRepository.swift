final class TestResultsRepository {
    
    private let storage: TestResultsStorage
    
    init(storage: TestResultsStorage) {
        self.storage = storage
    }
    
    func save(_ result: TestResult) {
        storage.save(result)
    }
    
    func allResults() -> [TestResult] {
        storage.loadAll()
    }
    
    func lastResult() -> TestResult? {
        storage.loadAll()
            .sorted { $0.completedAt > $1.completedAt }
            .first
    }
    
    func result(for topic: String) -> [TestResult] {
        storage.loadAll()
            .filter { $0.topic == topic }
    }
    
}
