import UIKit

final class QuizViewController: UIViewController {
    
    //MARK: - UI elements
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.progressTintColor = AppColors.accent
        progressView.trackTintColor = UIColor.white.withAlphaComponent(0.1)
        progressView.transform = CGAffineTransform(scaleX: 1, y: 2)
        return progressView
    }()
    
    private let questionView = QuestionView()
    
    private let tableView: UITableView = {
        let tableView = UITableView(
            frame: .zero,
            style: .plain
        )
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        
        tableView.alwaysBounceHorizontal = false
        tableView.contentInset = UIEdgeInsets(
            top: 4,
            left: 0,
            bottom: 8,
            right: 0
        )
        
        return tableView
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Далее", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.titleLabel?.font = AppFonts.button
        
        button.backgroundColor = AppColors.accent
        
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = true
        
        return button
    }()
    
    //MARK: - ViewModel
    
    private let viewModel: QuizViewModel
    
    //MARK: - Private properties
    
    private var selectedIds: Set<String> = []
    
    //MARK: - Callback
    
    var onFinish: (() -> Void)?
    var onExit: (() -> Void)?
        
    //MARK: - Init
    
    init(viewModel: QuizViewModel) {
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
        updateButtonTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation(animated: animated)
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        tableView.register(AnswerCell.self, forCellReuseIdentifier: AnswerCell.reuseId)
        tableView.isScrollEnabled = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 72
        tableView.delegate = self
        tableView.dataSource = self
        
        actionButton.addTarget(self, action: #selector(didTapAction), for: .touchUpInside)
        
        view.addSubview(progressView)
        view.addSubview(questionView)
        view.addSubview(tableView)
        view.addSubview(actionButton)
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        questionView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    private func bind() {
        questionView.configure(
            with: viewModel.questionText,
            imageURL: viewModel.imageURL
        )
        
        tableView.reloadData()
    }
    
    private func updateButtonTitle() {
        if viewModel.currentQuestionNumber == viewModel.totalQuestions {
            actionButton.setTitle("Завершить", for: .normal)
        } else {
            actionButton.setTitle("Далее", for: .normal)
        }
    }
    
    //MARK: - Navigation
    
    private func setupNavigation(animated: Bool) {
        title = viewModel.testTitle
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.backButtonDisplayMode = .minimal
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.backward"),
            style: .plain,
            target: self,
            action: #selector(didTapBack)
        )
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: - Button actions
    
    @objc private func didTapAction() {
        guard !selectedIds.isEmpty else { return }
        
        _ = viewModel.submit(selectedAnswerIds: Array(selectedIds))

        viewModel.nextQuestion()
        
        progressView.setProgress(viewModel.progress, animated: true)

        if viewModel.isFinished {
            onFinish?()
            return
        }

        selectedIds.removeAll()
        bind()

        updateButtonTitle()
    }
    
    @objc private func didTapBack() {
        let alert = UIAlertController(
            title: "Выйти из теста?",
            message: "Текущий прогресс будет потерян",
            preferredStyle: .alert
        )
        
        let cancelAction = UIAlertAction(title: "Остаться", style: .cancel)
        alert.addAction(cancelAction)
        
        let exitAction = UIAlertAction(title: "Выйти", style: .destructive) { [weak self] _ in
            self?.onExit?()
        }
        alert.addAction(exitAction)
        
        present(alert, animated: true)
    }
    
    //MARK: - Private methods
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            questionView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 16),
            questionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            questionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            tableView.topAnchor.constraint(equalTo: questionView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -20),
            
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            actionButton.heightAnchor.constraint(equalToConstant: 58)
        ])
    }
    
}

extension QuizViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = viewModel.answers[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AnswerCell.reuseId, for: indexPath) as! AnswerCell
        
        let isSelected = selectedIds.contains(answer.id)
        
        cell.configure(text: answer.text, selected: isSelected)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.answers.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let answer = viewModel.answers[indexPath.row]
        
        if viewModel.allowsMultipleSelection {
            if selectedIds.contains(answer.id) {
                selectedIds.remove(answer.id)
            } else {
                selectedIds.insert(answer.id)
            }
        } else {
            selectedIds = [answer.id]
        }
                
        tableView.reloadData()
    }
}
