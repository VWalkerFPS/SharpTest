import UIKit

final class ResultCell: UITableViewCell {
    
    static let reuseId = "ResultCell"
    
    //MARK: - UI
    
    private let containerView: UIView = {
        let container = UIView()
        container.backgroundColor = AppColors.surface
        container.layer.cornerRadius = 24
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor.white.withAlphaComponent(0.06).cgColor
        return container
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
        
        imageView.image = UIImage(systemName: "xmark.circle.fill")
        imageView.tintColor = AppColors.error
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.titleMedium
        label.textColor = AppColors.textPrimary
        label.numberOfLines = 0
        label.textAlignment = .left
        label.setContentCompressionResistancePriority(
            .required,
            for: .vertical
        )
        return label
    }()
    
    private let userAnswerTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.bodyMedium
        label.textColor = AppColors.error
        label.text = "Ваш ответ"
        return label
    }()
    
    private let userAnswerLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.body
        label.textColor = AppColors.error
        label.numberOfLines = 0
        return label
    }()
    
    private let correctAnswerTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.bodyMedium
        label.textColor = AppColors.success
        label.text = "Правильный ответ"
        return label
    }()
    
    private let correctAnswerLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.body
        label.textColor = AppColors.success
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(iconContainerView)
        iconContainerView.addSubview(iconImageView)
        containerView.addSubview(questionLabel)
        containerView.addSubview(userAnswerTitleLabel)
        containerView.addSubview(correctAnswerTitleLabel)
        containerView.addSubview(userAnswerLabel)
        containerView.addSubview(correctAnswerLabel)
        
        iconContainerView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        userAnswerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        correctAnswerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        userAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        correctAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 8
            ),
            containerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -8
            ),
            containerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            containerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
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

            questionLabel.leadingAnchor.constraint(
                equalTo: iconContainerView.trailingAnchor,
                constant: 16
            ),
            questionLabel.firstBaselineAnchor.constraint(
                equalTo: iconContainerView.centerYAnchor
            ),
            questionLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -20
            ),
            questionLabel.bottomAnchor.constraint(
                greaterThanOrEqualTo: iconContainerView.bottomAnchor
            ),

            userAnswerTitleLabel.topAnchor.constraint(
                equalTo: questionLabel.bottomAnchor,
                constant: 20
            ),
            userAnswerTitleLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: 20
            ),
            userAnswerTitleLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -20
            ),

            userAnswerLabel.topAnchor.constraint(
                equalTo: userAnswerTitleLabel.bottomAnchor,
                constant: 8
            ),
            userAnswerLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: 20
            ),
            userAnswerLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -20
            ),

            correctAnswerTitleLabel.topAnchor.constraint(
                equalTo: userAnswerLabel.bottomAnchor,
                constant: 20
            ),
            correctAnswerTitleLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: 20
            ),
            correctAnswerTitleLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -20
            ),

            correctAnswerLabel.topAnchor.constraint(
                equalTo: correctAnswerTitleLabel.bottomAnchor,
                constant: 8
            ),
            correctAnswerLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: 20
            ),
            correctAnswerLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -20
            ),
            correctAnswerLabel.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -24
            )
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    
    func configure(with item: UserAnswer) {
        questionLabel.text = item.question.text
        
        let selectedTexts = item.question.answers
            .filter { item.selectedIds.contains($0.id) }
            .map { $0.text }
            .joined(separator: ", ")
        
        userAnswerLabel.text = selectedTexts.isEmpty ? "-" : selectedTexts
        
        let correctTexts = item.question.answers
            .filter { $0.isCorrect }
            .map { $0.text }
            .joined(separator: ", ")
        
        correctAnswerLabel.text = correctTexts
    }
    
}
