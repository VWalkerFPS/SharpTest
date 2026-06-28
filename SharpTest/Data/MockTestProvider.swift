
final class MockTestProvider: TestProvider {
    
    func loadTests() -> [Test] {
        MockData.makeTests()
    }
    
}
