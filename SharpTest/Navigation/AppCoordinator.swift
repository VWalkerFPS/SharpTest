import UIKit

final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private let dependencies: AppDependencies
    
    private var childCoordinators: [Coordinator] = []
    
    init(
        window: UIWindow,
        dependencies: AppDependencies
    ) {
        self.window = window
        self.dependencies = dependencies
    }
    
    func start() {
        let tabBarController = MainTabBarController()
        
        let testsCoordinator = TestsCoordinator(dependencies: dependencies)
        testsCoordinator.start()
        
        childCoordinators = [
            testsCoordinator
        ]
        
        tabBarController.viewControllers = [
            testsCoordinator.navigationController
        ]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
}
