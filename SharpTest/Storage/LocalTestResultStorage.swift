import Foundation

final class LocalTestResultStorage: TestResultsStorage {
    
    private let key = "test_results"
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func loadAll() -> [TestResult] {
        guard let data = userDefaults.data(forKey: key) else {
            return []
        }
        
        do {
            return try JSONDecoder().decode([TestResult].self, from: data)
        } catch {
            return []
        }
    }
    
    func save(_ result: TestResult) {
        var results = loadAll()
        results.append(result)
        
        do {
            let data = try JSONEncoder().encode(results)
            userDefaults.set(data, forKey: key)
        } catch {
            return
        }
    }
    
}
