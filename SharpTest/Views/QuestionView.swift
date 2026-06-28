import UIKit

final class QuestionView: UIView {
    private let iconContainerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = AppColors.surfaceSecondary
        
        view.layer.cornerRadius = 22
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.06).cgColor
        
        return view
    }()
    
    private var imageTopConstraint: NSLayoutConstraint?
    private var imageHeightConstraint: NSLayoutConstraint?
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "questionmark")
        imageView.tintColor = AppColors.accent
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = AppColors.textPrimary
        label.font = AppFonts.title
        label.numberOfLines = 0
        
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.isHidden = true
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String, imageURL: String?) {
        titleLabel.text = text
        
        let hasImage = imageURL != nil
        
        imageView.isHidden = !hasImage
        imageTopConstraint?.constant = hasImage ? 20 : 0
        imageHeightConstraint?.constant = hasImage ? 180 : 0
        
        //Image load
    }
    
    private func setup() {
        backgroundColor = AppColors.surface
        
        layer.cornerRadius = 28
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.withAlphaComponent(0.08).cgColor
        layer.masksToBounds = true
        
        addSubview(iconContainerView)
        iconContainerView.addSubview(iconImageView)
        
        addSubview(titleLabel)
        addSubview(imageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        iconContainerView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageTopConstraint = imageView.topAnchor.constraint(
            equalTo: titleLabel.bottomAnchor,
            constant: 0
        )
        imageHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: 0)
        
        NSLayoutConstraint.activate([
            iconContainerView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 24
            ),
            iconContainerView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 24
            ),
            iconContainerView.widthAnchor.constraint(
                equalToConstant: 44
            ),
            iconContainerView.heightAnchor.constraint(
                equalToConstant: 44
            ),
            
            iconImageView.centerXAnchor.constraint(
                equalTo: iconContainerView.centerXAnchor
            ),
            iconImageView.centerYAnchor.constraint(
                equalTo: iconContainerView.centerYAnchor
            ),
            iconImageView.widthAnchor.constraint(
                equalToConstant: 20
            ),
            iconImageView.heightAnchor.constraint(
                equalToConstant: 20
            ),
            
            titleLabel.topAnchor.constraint(
                equalTo: iconContainerView.bottomAnchor,
                constant: 20
            ),
            titleLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 24
            ),
            titleLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -24
            ),
            
            imageTopConstraint!,
            imageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 24
            ),
            imageView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -24
            ),
            imageView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -24
            ),
            imageHeightConstraint!
        ])
    }
}
