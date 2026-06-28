import UIKit

final class TopicCell: UICollectionViewCell {
    
    static let reuseId = "TopicCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.bodyMedium
        label.textAlignment = .center
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, isSelected: Bool) {
        titleLabel.text = title
        
        titleLabel.textColor = isSelected ? .white : AppColors.textSecondary
        
        contentView.backgroundColor = isSelected ? AppColors.accent : AppColors.surface
        contentView.layer.borderColor = isSelected ? AppColors.accent.cgColor : UIColor.white.withAlphaComponent(0.06).cgColor
    }
    
    private func setupUI() {
        contentView.layer.cornerRadius = 18
        contentView.layer.borderWidth = 1
        contentView.layer.masksToBounds = true
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
}
