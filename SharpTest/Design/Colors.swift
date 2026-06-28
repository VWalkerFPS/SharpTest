import UIKit

enum AppColors {
    
    // MARK: - Background
    
    static let background = UIColor(
        red: 20/255,
        green: 25/255,
        blue: 60/255,
        alpha: 1
    )
    
    // MARK: - Accent
    
    static let primary = UIColor(
        red: 110/255,
        green: 80/255,
        blue: 255/255,
        alpha: 1
    )
    
    static let accent = UIColor(
        red: 160/255,
        green: 120/255,
        blue: 255/255,
        alpha: 1
    )
    
    // MARK: - Surface
    
    static let surface = UIColor(
        white: 1,
        alpha: 0.04
    )
    
    static let surfaceSecondary = UIColor(
        white: 1,
        alpha: 0.08
    )
    
    static let separator = UIColor(
        white: 1,
        alpha: 0.08
    )
    
    // MARK: - Text
    
    static let textPrimary = UIColor.white
    
    static let textSecondary = UIColor(
        white: 1,
        alpha: 0.65
    )
    
    // MARK: - State
    
    static let success = UIColor.systemGreen
    
    static let error = UIColor.systemRed
}
