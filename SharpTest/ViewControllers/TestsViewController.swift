import UIKit

final class TestsViewController: UIViewController {
    
    //MARK: - UI elements
    
    private let gradientLayer = GradientFactory.backgroundGradient

    private let topicsLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        return layout
    }()
    
    private lazy var topicsCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: topicsLayout)
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        collection.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return collection
    }()

    private let tableView: UITableView = {
        let table = UITableView(
            frame: .zero,
            style: .plain
        )
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.showsHorizontalScrollIndicator = false
        return table
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.08)
        return view
    }()
    
    private let lastResultView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.surface
        view.layer.cornerRadius = 24
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.06).cgColor
        return view
    }()

    private let lastResultTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Последний результат"
        label.font = AppFonts.secondaryBody
        label.textColor = AppColors.textSecondary
        return label
    }()

    private let lastResultValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Нет результатов"
        label.font = AppFonts.titleMedium
        label.textColor = AppColors.textPrimary
        return label
    }()
    
    //MARK: - Callback
    
    var onTestSelected: ((Test) -> Void)?
    
    //MARK: - ViewModel
    
    private var viewModel: TestsViewModel
    
    //MARK: - Init
    
    init(viewModel: TestsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.insertSublayer(gradientLayer, at: 0)
                
        setupUI()
        
        setupTopicsCollectionView()
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
        
        updateTableScrollingBehavior()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation(animated: animated)
        updateLastResult()
    }
    
    //MARK: - Navigation
    
    private func setupNavigation(animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        view.addSubview(topicsCollectionView)
        view.addSubview(tableView)
        view.addSubview(separatorView)
        view.addSubview(lastResultView)
        lastResultView.addSubview(lastResultTitleLabel)
        lastResultView.addSubview(lastResultValueLabel)

        topicsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        lastResultView.translatesAutoresizingMaskIntoConstraints = false
        lastResultTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        lastResultValueLabel.translatesAutoresizingMaskIntoConstraints = false

        setupConstraints()
    }
    
    //MARK: - Private Methods
    
    private func updateLastResult() {
        lastResultValueLabel.text = viewModel.lastResultText
    }
    
    private func showEmptyTestAlert() {
        let alert = UIAlertController(
            title: "Тест недоступен",
            message: "В этом тесте пока нет вопросов",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            topicsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            topicsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topicsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topicsCollectionView.heightAnchor.constraint(equalToConstant: 44),

            tableView.topAnchor.constraint(equalTo: topicsCollectionView.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -12),

            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.bottomAnchor.constraint(equalTo: lastResultView.topAnchor, constant: -16),

            lastResultView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            lastResultView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            lastResultView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),

            lastResultTitleLabel.topAnchor.constraint(equalTo: lastResultView.topAnchor, constant: 16),
            lastResultTitleLabel.leadingAnchor.constraint(equalTo: lastResultView.leadingAnchor, constant: 20),
            lastResultTitleLabel.trailingAnchor.constraint(equalTo: lastResultView.trailingAnchor, constant: -20),

            lastResultValueLabel.topAnchor.constraint(equalTo: lastResultTitleLabel.bottomAnchor, constant: 6),
            lastResultValueLabel.leadingAnchor.constraint(equalTo: lastResultView.leadingAnchor, constant: 20),
            lastResultValueLabel.trailingAnchor.constraint(equalTo: lastResultView.trailingAnchor, constant: -20),
            lastResultValueLabel.bottomAnchor.constraint(equalTo: lastResultView.bottomAnchor, constant: -16)
        ])
    }
    
}

//MARK: - TopicsCollectionView configure

extension TestsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private func setupTopicsCollectionView() {
        topicsCollectionView.delegate = self
        topicsCollectionView.dataSource = self
        
        topicsCollectionView.register(TopicCell.self, forCellWithReuseIdentifier: TopicCell.reuseId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.topics.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicCell.reuseId, for: indexPath) as! TopicCell
        
        let title = topicTitle(at: indexPath.item)
        
        let isAllTopicsItem = indexPath.item == 0
        let isSelected: Bool
        
        if isAllTopicsItem {
            isSelected = viewModel.selectedTopic == nil
        } else {
            isSelected = viewModel.selectedTopic == title
        }
        
        cell.configure(title: title, isSelected: isSelected)
        return cell
    }
    
    private func topicTitle(at index: Int) -> String {
        if index == 0 {
            return "Все"
        }
        
        return viewModel.topics[index - 1]
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            viewModel.selectTopic(nil)
        } else {
            let topic = viewModel.topics[indexPath.item - 1]
            viewModel.selectTopic(topic)
        }
        
        collectionView.reloadData()
        tableView.reloadData()
        
        tableView.layoutIfNeeded()
        updateTableScrollingBehavior()
        
        tableView.setContentOffset(
            CGPoint(x: 0, y: -tableView.adjustedContentInset.top),
            animated: false
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let title = topicTitle(at: indexPath.item)
        
        let textWidth = title.size(
            withAttributes: [.font: AppFonts.bodyMedium]
        ).width
        
        let horizontalPadding: CGFloat = 32
        
        return CGSize(width: ceil(textWidth) + horizontalPadding, height: 38)
    }
    
}

//MARK: - TestsTableView configure

extension TestsViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TestCell.self, forCellReuseIdentifier: TestCell.reuseId)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        tableView.bounces = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.testsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TestCell.reuseId, for: indexPath) as! TestCell
        let test = viewModel.test(at: indexPath.row)
        cell.configure(with: test)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let test = viewModel.test(at: indexPath.row)
        
        if test.questions.isEmpty {
            showEmptyTestAlert()
            return
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        onTestSelected?(test)
    }
    
    private func updateTableScrollingBehavior() {
        tableView.layoutIfNeeded()
        
        let visibleHeight = tableView.bounds.height
            - tableView.adjustedContentInset.top
            - tableView.adjustedContentInset.bottom
        
        let overflow = tableView.contentSize.height - visibleHeight
        let minimalUsefulScrollDistance: CGFloat = 40
        
        let shouldScroll = overflow > minimalUsefulScrollDistance
        
        tableView.isScrollEnabled = shouldScroll
        tableView.bounces = shouldScroll
    }

}
