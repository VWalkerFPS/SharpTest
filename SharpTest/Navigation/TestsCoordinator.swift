
import UIKit

final class TestsCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    private let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.navigationController = UINavigationController()
        self.dependencies = dependencies
        defer {
            setupNavigationController()
        }
    }
    
    func start() {
        let provider = dependencies.mockTestProvider
        
        let viewModel = TestsViewModel(
            provider: provider,
            testResultsRepository: dependencies.testResultsRepository
        )
        
        let viewController = TestsViewController(viewModel: viewModel)
        
        viewController.onTestSelected = { [weak self] test in
            self?.showQuiz(for: test)
        }
        
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    private func showQuiz(for test: Test) {
        let service = QuizService(test: test)
        let viewModel = QuizViewModel(service: service)
        let viewController = QuizViewController(viewModel: viewModel)
        
        viewController.hidesBottomBarWhenPushed = true
        
        viewController.onFinish = { [weak self] in
            self?.showResult(service: service)
        }
        
        viewController.onExit = { [weak self] in
            self?.navigationController.popToRootViewController(animated: true)
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showResult(service: QuizService) {
        let viewModel = ResultViewModel(
            service: service,
            resultRepository: dependencies.testResultsRepository
        )
        
        let viewController = ResultViewController(viewModel: viewModel)
        viewController.hidesBottomBarWhenPushed = true
        
        viewController.onBackToTests = { [weak self] in
            self?.navigationController.popToRootViewController(animated: true)
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func setupNavigationController() {
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.tintColor = AppColors.textPrimary
        navigationController.navigationBar.titleTextAttributes = [
            .foregroundColor: AppColors.textPrimary
        ]
        navigationController.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: AppColors.textPrimary
        ]
        
        navigationController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "doc.text"),
            tag: 0
        )
    }
    
}
