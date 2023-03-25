import UIKit

protocol DetailViewProtocol: AnyObject {
    func setupView(image: String, title: String, descriprion: String)
    func sucsess()
    var customStackView: DetailStackView { get set }
    var customAuthorView: DetailAuthorView { get set }
}

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol?
    var customStackView = DetailStackView()
    var customAuthorView = DetailAuthorView()
    
    private var customBuyView = DetailBuyButtonsView()
    private let justView = UIView()
    
    private let  imageOfRecipe: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let nameOfRecipe: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.font = .semiBold18
        name.numberOfLines = 0
        return name
    }()
    
    private let productLabel: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.font = .semiBold18
        name.text = "Products"
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var showAllButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Show more", for: .normal)
        btn.titleLabel?.font = .semiBold14
        btn.setTitleColor(.orange, for: .normal)
        btn.addTarget(self, action: #selector(showMore), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let descriptionOfRecipe: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.font = .regular14
        name.numberOfLines = 3
        return name
    }()
    
    private lazy var barButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.setTitle("  Search", for: .normal)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        button.tintColor = .orange
        return button
    }()
    
    private lazy var barButtonItems: [UIBarButtonItem] = {
        let favButton = UIBarButtonItem(image: UIImage(systemName: "heart"))
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"))
        let cartButton = UIBarButtonItem(image: UIImage(systemName: "cart"))
        favButton.tintColor = .orange
        shareButton.tintColor = .orange
        cartButton.tintColor = .orange
        return [cartButton,favButton,shareButton]
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    private lazy var tableView: AutoSizing = {
        let view = AutoSizing()
        view.backgroundColor = .mainColor
        view.dataSource = self
        view.delegate = self
        view.showsVerticalScrollIndicator = false
        view.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        view.separatorColor = .gray
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [nameOfRecipe,descriptionOfRecipe])
        view.axis = .vertical
        view.spacing = 15
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getInfo()
        setupView()
        configureView()
    }

    func setupView(image: String, title: String, descriprion: String) {
        imageOfRecipe.kf.setImage(with: URL(string: image), placeholder: UIImage(named: "salat"))
        imageOfRecipe.kf.indicatorType = .activity
        nameOfRecipe.text = title
        descriptionOfRecipe.text = descriprion
    }
    
    func sucsess() {
        tableView.reloadData()
    }
    
    @objc func goBack() {
        dismiss(animated: true)
    }
    
    @objc func showMore() {
        descriptionOfRecipe.numberOfLines = 0
        showAllButton.isHidden = true
        showAllButton.snp.remakeConstraints { make in
            make.topMargin.equalTo(stackView.snp.bottomMargin).inset(-10)
            make.leadingMargin.equalToSuperview().inset(15)
            make.height.equalTo(0)
        }
    }
}

extension DetailViewController: DetailViewProtocol {
}

private extension DetailViewController {
    
    func configureView() {
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: barButton)
        navigationItem.rightBarButtonItems = barButtonItems
        view.backgroundColor = .mainColor
        let appearcen = UINavigationBarAppearance()
        appearcen.configureWithOpaqueBackground()
        appearcen.backgroundColor = .navigationBarColor
        navigationController?.navigationBar.scrollEdgeAppearance = appearcen
    }

    
    func setupView() {
        view.addSubview(scrollView)
        view.addSubview(customBuyView)
        scrollView.addSubview(justView)
        justView.addSubview(stackView)
        justView.addSubview(tableView)
        justView.addSubview(imageOfRecipe)
        justView.addSubview(customStackView)
        justView.addSubview(showAllButton)
        justView.addSubview(customAuthorView)
        justView.addSubview(productLabel)
        
        scrollView.snp.makeConstraints { make in
            make.topMargin.leading.trailing.equalToSuperview()
        }
        
        customBuyView.snp.makeConstraints { make in
            make.topMargin.equalTo(scrollView.snp.bottomMargin).inset(-10)
            make.leading.trailing.bottomMargin.equalToSuperview()
            make.width.equalTo(justView.snp.width)
            make.height.equalTo(70)
        }
        
        justView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(imageOfRecipe.snp.bottomMargin).offset(50)
            make.horizontalEdges.equalTo(justView).inset(15)
        }
        
        imageOfRecipe.snp.makeConstraints { make in
            make.top.equalTo(justView)
            make.horizontalEdges.equalTo(justView)
            make.height.equalTo(200)
        }
        
        showAllButton.snp.makeConstraints { make in
            make.topMargin.equalTo(stackView.snp.bottomMargin).inset(-10)
            make.leadingMargin.equalToSuperview().inset(15)
            make.height.equalTo(30)
        }
        
        customAuthorView.snp.makeConstraints { make in
            make.topMargin.equalTo(showAllButton.snp.bottomMargin).inset(-30)
            make.horizontalEdges.equalTo(justView).inset(15)
        }
        
        customStackView.snp.makeConstraints { make in
            make.topMargin.equalTo(customAuthorView.snp.bottomMargin).inset(-40)
            make.horizontalEdges.equalTo(justView).inset(15)
        }
        
        productLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(customStackView.snp.bottomMargin).inset(-40)
            make.leadingMargin.equalTo(justView).inset(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.topMargin.equalTo(productLabel.snp.bottomMargin).inset(-20)
            make.horizontalEdges.equalTo(justView).inset(0)
            make.bottomMargin.equalTo(justView).inset(15)
        }
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.viewModel?.detailViewModel?.extendedIngredients.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell = UITableViewCell(style: .value1, reuseIdentifier: "cellID")
        guard let model = presenter?.viewModel?.detailViewModel?.extendedIngredients[indexPath.row] else { return UITableViewCell() }
        cell.backgroundColor = .mainColor
        cell.textLabel?.textColor = .lightGray
        cell.textLabel?.font = .regular15
        cell.detailTextLabel?.font = .regular15
        cell.detailTextLabel?.textColor = .white
        cell.textLabel?.text = presenter?.viewModel?.detailViewModel?.extendedIngredients[indexPath.row].name
        cell.detailTextLabel?.text = "\(model.amount) \(model.measures.us.unitLong)"
        return cell
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
