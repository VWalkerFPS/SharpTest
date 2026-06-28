protocol TestResultsStorage {
    
    func save(_ result: TestResult)
    
    func loadAll() -> [TestResult]
    
}
