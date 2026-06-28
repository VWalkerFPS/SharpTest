import UIKit

extension UIViewController {
    func applyGradient() {
        let gradient = GradientFactory.backgroundGradient
        gradient.frame = UIScreen.main.bounds
        gradient.zPosition = -1
        view.layer.insertSublayer(gradient, at: 0)
    }
}
