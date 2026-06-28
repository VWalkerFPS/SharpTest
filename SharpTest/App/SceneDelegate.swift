import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
        
    var window: UIWindow?
    private var appCoordinator: AppCoordinator?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let dependencies = AppDependencies()
        
        let appCoordinator = AppCoordinator(
            window: window,
            dependencies: dependencies
        )
        
        self.window = window
        self.appCoordinator = appCoordinator
        
        appCoordinator.start()
    }
    
}
