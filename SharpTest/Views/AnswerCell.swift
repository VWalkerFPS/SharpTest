import UIKit

final class AnswerCell: UITableViewCell {
    static let reuseId = "AnswerCell"
    
    private let containerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = AppColors.surface
        
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.06).cgColor
        
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = AppColors.textPrimary
        label.font = AppFonts.body
        label.numberOfLines = 0
        
        return label
    }()
    
    private let checkmarkImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
        imageView.tintColor = AppColors.accent
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(containerView)
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(checkmarkImageView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        checkmarkImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 6
            ),
            containerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -6
            ),
            containerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            containerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
            
            titleLabel.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: 20
            ),
            titleLabel.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -20
            ),
            titleLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: 20
            ),
            titleLabel.trailingAnchor.constraint(
                equalTo: checkmarkImageView.leadingAnchor,
                constant: -16
            ),
            
            checkmarkImageView.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor
            ),
            checkmarkImageView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -20
            ),
            checkmarkImageView.widthAnchor.constraint(
                equalToConstant: 24
            ),
            checkmarkImageView.heightAnchor.constraint(
                equalToConstant: 24
            )
        ])
    }
    
    func configure(text: String, selected: Bool) {
        titleLabel.text = text
        
        checkmarkImageView.isHidden = !selected
        
        self.containerView.backgroundColor = selected
        ? AppColors.surfaceSecondary
        : AppColors.surface
        
        self.containerView.layer.borderColor = selected
        ? AppColors.accent.cgColor
        : UIColor.white.withAlphaComponent(0.06).cgColor
        
    }
}
