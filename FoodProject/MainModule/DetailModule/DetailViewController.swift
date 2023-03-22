import UIKit

protocol DetailViewProtocol: AnyObject {
    func setupView(image: String, title: String, descriprion: String)
    func sucsess()
    var customView: DetailView { get set }
}

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol?
    
    private let  imageOfRecipe: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let nameOfRecipe: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.numberOfLines = 0
        name.font = .systemFont(ofSize: 25, weight: .bold)
        return name
    }()
    
    private let descriptionOfRecipe: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.font = .systemFont(ofSize: 15, weight: .regular)
        name.numberOfLines = 0
        return name
    }()
    
    private let justView = UIView()
    
    private lazy var barButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.setTitle("  Поиск", for: .normal)
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
        view.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.separatorColor = .gray
        view.register(UITableViewCell.self, forCellReuseIdentifier: "privet")
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [nameOfRecipe,descriptionOfRecipe,customView])
        view.axis = .vertical
        view.spacing = 15
        return view
    }()
    
    var customView = DetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter?.getInfo()
        configureView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: barButton)
        navigationItem.rightBarButtonItems = barButtonItems
        view.backgroundColor = .mainColor
        let appearcen = UINavigationBarAppearance()
        appearcen.configureWithOpaqueBackground()
        appearcen.backgroundColor = .navigationBarColor
        navigationController!.navigationBar.scrollEdgeAppearance = appearcen
        
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
}

extension DetailViewController: DetailViewProtocol {
}

private extension DetailViewController {

    
    func configureView() {
        view.addSubview(scrollView)
        scrollView.addSubview(justView)
        justView.addSubview(stackView)
        justView.addSubview(tableView)
        justView.addSubview(imageOfRecipe)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(justView.snp.width)
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
        
        tableView.snp.makeConstraints { make in
            make.topMargin.equalTo(stackView.snp.bottomMargin).inset(-20)
            make.horizontalEdges.equalTo(justView).inset(15)
            make.bottomMargin.equalTo(justView).inset(15)
        }
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.viewModel?.detailViewModel?.extendedIngredients.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "privet", for: indexPath)
        cell = UITableViewCell(style: .value1, reuseIdentifier: "privet")
        guard let model = presenter?.viewModel?.detailViewModel?.extendedIngredients[indexPath.row] else { return UITableViewCell() }
        cell.backgroundColor = .mainColor
        cell.textLabel?.textColor = .lightGray
        cell.textLabel?.font = .systemFont(ofSize: 15, weight: .light)
        cell.detailTextLabel?.font = .systemFont(ofSize: 18, weight: .light)
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


class AutoSizing: UITableView {

    override var intrinsicContentSize: CGSize {
        return contentSize
    }
    
    override func reloadData() {
        super.reloadData()
        invalidateIntrinsicContentSize()
    }
}
