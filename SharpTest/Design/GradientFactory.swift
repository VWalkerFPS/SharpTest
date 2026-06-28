import UIKit

enum GradientFactory {
    
    static var backgroundGradient: CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.colors = [
            AppColors.primary.cgColor,
            AppColors.background.cgColor
        ]
        
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        return gradient
    }
    
}
