import UIKit

final class ResultViewController: UIViewController {
    
    //MARK: - UI
    
    private let resultContainerView: UIView = {
        let view = UIView()

        view.backgroundColor = AppColors.surface
        view.layer.cornerRadius = 28
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.06).cgColor

        return view
    }()

    private let resultIconImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.image = UIImage(systemName: "trophy.fill")
        imageView.tintColor = AppColors.accent
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    private let resultLabel: UILabel = {
        let label = UILabel()

        label.font = AppFonts.largeTitle
        label.textColor = AppColors.textPrimary
        label.textAlignment = .center

        return label
    }()

    private let percentageLabel: UILabel = {
        let label = UILabel()

        label.font = AppFonts.titleMedium
        label.textColor = AppColors.textSecondary
        label.textAlignment = .center

        return label
    }()

    private let mistakesTitleLabel: UILabel = {
        let label = UILabel()

        label.text = "Разбор ошибок"
        label.font = AppFonts.titleMedium
        label.textColor = AppColors.textPrimary

        return label
    }()

    private let successLabel: UILabel = {
        let label = UILabel()

        label.text = "Все ответы правильные 🎉"
        label.font = AppFonts.titleMedium
        label.textColor = AppColors.success
        label.textAlignment = .center
        label.numberOfLines = 0

        return label
    }()
    
    private let tableView: UITableView = {
        let table = UITableView(
            frame: .zero,
            style: .plain
        )
        
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.allowsSelection = false
        
        table.showsVerticalScrollIndicator = false
        table.showsHorizontalScrollIndicator = false
        
        table.contentInset = UIEdgeInsets(
            top: 8,
            left: 0,
            bottom: 8,
            right: 0
        )
        
        return table
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("К тестам", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.titleLabel?.font = AppFonts.button
        
        button.backgroundColor = AppColors.accent
        
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = true
        
        return button
    }()
    
    //MARK: - ViewModel
    
    private let viewModel: ResultViewModel
    
    //MARK: - Callback
    var onBackToTests: (() -> Void)?
    
    //MARK: - Init
    
    init(viewModel: ResultViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.background
        
        setupUI()
        bind()
        
        viewModel.saveResult()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation(animated: animated)
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        tableView.register(ResultCell.self, forCellReuseIdentifier: ResultCell.reuseId)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        
        view.addSubview(resultContainerView)
        
        resultContainerView.addSubview(resultIconImageView)
        resultContainerView.addSubview(resultLabel)
        resultContainerView.addSubview(percentageLabel)
        
        view.addSubview(mistakesTitleLabel)
        view.addSubview(successLabel)
        view.addSubview(tableView)
        view.addSubview(backButton)

        resultContainerView.translatesAutoresizingMaskIntoConstraints = false
        resultIconImageView.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        percentageLabel.translatesAutoresizingMaskIntoConstraints = false
        mistakesTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        successLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            resultContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            resultContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            resultContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            resultIconImageView.topAnchor.constraint(equalTo: resultContainerView.topAnchor, constant: 24),
            resultIconImageView.centerXAnchor.constraint(equalTo: resultContainerView.centerXAnchor),
            resultIconImageView.widthAnchor.constraint(equalToConstant: 40),
            resultIconImageView.heightAnchor.constraint(equalToConstant: 40),

            resultLabel.topAnchor.constraint(equalTo: resultIconImageView.bottomAnchor, constant: 16),
            resultLabel.leadingAnchor.constraint(equalTo: resultContainerView.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: resultContainerView.trailingAnchor, constant: -20),

            percentageLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 8),
            percentageLabel.leadingAnchor.constraint(equalTo: resultLabel.leadingAnchor),
            percentageLabel.trailingAnchor.constraint(equalTo: resultLabel.trailingAnchor),
            percentageLabel.bottomAnchor.constraint(equalTo: resultContainerView.bottomAnchor, constant: -24),

            mistakesTitleLabel.topAnchor.constraint(equalTo: resultContainerView.bottomAnchor, constant: 24),
            mistakesTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mistakesTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            successLabel.topAnchor.constraint(equalTo: resultContainerView.bottomAnchor, constant: 24),
            successLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            successLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            tableView.topAnchor.constraint(equalTo: mistakesTitleLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -24),

            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            backButton.heightAnchor.constraint(equalToConstant: 58)
        ])
    }
    
    private func bind() {
        resultLabel.text = viewModel.scoreText

        percentageLabel.text = viewModel.percentage

        successLabel.isHidden = viewModel.hasMistakes
        mistakesTitleLabel.isHidden = !viewModel.hasMistakes
        tableView.isHidden = !viewModel.hasMistakes
    }
    
    @objc private func didTapBack() {
        onBackToTests?()
    }
    
    //MARK: - Navigation
    
    private func setupNavigation(animated: Bool) {
        navigationItem.hidesBackButton = true
        navigationItem.largeTitleDisplayMode = .never
        title = "Результат"
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}

//MARK: - TableView configure

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.wrongAnswersCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.wrongAnswers[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ResultCell.reuseId,
            for: indexPath
        ) as! ResultCell
        
        cell.configure(with: item)
        
        return cell
    }
    
}
