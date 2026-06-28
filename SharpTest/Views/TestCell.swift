import UIKit

final class TestCell: UITableViewCell {
    
    static let reuseId: String = "TestCell"
    
    //MARK: - UI elements
    
    private let containerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = AppColors.surface
        
        view.layer.cornerRadius = 24
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.06).cgColor
        
        return view
    }()
    
    private let iconContainerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = AppColors.surfaceSecondary
        
        view.layer.cornerRadius = 18
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.06).cgColor
        
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "book.fill")
        imageView.tintColor = AppColors.accent
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.textPrimary
        label.font = AppFonts.titleMedium
        label.numberOfLines = 1
        return label
    }()
    
    private let topicLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.accent
        label.font = AppFonts.captionMedium
        label.numberOfLines = 1
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.textSecondary
        label.font = AppFonts.secondaryBody
        label.numberOfLines = 3
        return label
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public methods
    
    func configure(with test: Test) {
        titleLabel.text = test.title
        topicLabel.text = test.topic
        descriptionLabel.text = test.description
    }
    
    //MARK: - Private methods
    
    private func setupUI() {
        contentView.addSubview(containerView)
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(topicLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(iconContainerView)
        iconContainerView.addSubview(iconImageView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        iconContainerView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        topicLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        selectionStyle = .none
        backgroundColor = .clear
        
        NSLayoutConstraint.activate(
            [
                containerView.topAnchor.constraint(
                    equalTo: contentView.topAnchor,
                    constant: 8
                ),
                containerView.leadingAnchor.constraint(
                    equalTo: contentView.leadingAnchor,
                    constant: 16
                ),
                containerView.trailingAnchor.constraint(
                    equalTo: contentView.trailingAnchor,
                    constant: -16
                ),
                containerView.bottomAnchor.constraint(
                    equalTo: contentView.bottomAnchor,
                    constant: -8
                ),
                
                iconContainerView.topAnchor.constraint(
                    equalTo: containerView.topAnchor,
                    constant: 20
                ),
                iconContainerView.leadingAnchor.constraint(
                    equalTo: containerView.leadingAnchor,
                    constant: 20
                ),
                iconContainerView.widthAnchor.constraint(
                    equalToConstant: 36
                ),
                iconContainerView.heightAnchor.constraint(
                    equalToConstant: 36
                ),
                
                iconImageView.centerXAnchor.constraint(
                    equalTo: iconContainerView.centerXAnchor
                ),
                iconImageView.centerYAnchor.constraint(
                    equalTo: iconContainerView.centerYAnchor
                ),
                iconImageView.widthAnchor.constraint(
                    equalToConstant: 18
                ),
                iconImageView.heightAnchor.constraint(
                    equalToConstant: 18
                ),
                
                titleLabel.topAnchor.constraint(
                    equalTo: containerView.topAnchor,
                    constant: 20
                ),
                titleLabel.leadingAnchor.constraint(
                    equalTo: iconContainerView.trailingAnchor,
                    constant: 16
                ),
                titleLabel.trailingAnchor.constraint(
                    equalTo: containerView.trailingAnchor,
                    constant: -20
                ),
                titleLabel.centerYAnchor.constraint(
                    equalTo: iconContainerView.centerYAnchor
                ),
                
                topicLabel.topAnchor.constraint(
                    equalTo: iconContainerView.bottomAnchor,
                    constant: 16
                ),
                topicLabel.leadingAnchor.constraint(
                    equalTo: titleLabel.leadingAnchor
                ),
                topicLabel.trailingAnchor.constraint(
                    equalTo: titleLabel.trailingAnchor
                ),

                descriptionLabel.topAnchor.constraint(
                    equalTo: topicLabel.bottomAnchor,
                    constant: 6
                ),
                descriptionLabel.leadingAnchor.constraint(
                    equalTo: titleLabel.leadingAnchor
                ),
                descriptionLabel.trailingAnchor.constraint(
                    equalTo: titleLabel.trailingAnchor
                ),
                descriptionLabel.bottomAnchor.constraint(
                    equalTo: containerView.bottomAnchor,
                    constant: -20
                )
            ]
        )
    }
    
}
