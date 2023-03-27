import UIKit

protocol SearchViewProtocol: AnyObject {
    func presentController(viewController: UIViewController)
}

class SearchViewController: UIViewController {
    
    fileprivate enum MenuOptions: String, CaseIterable {
        case terms = "First course"
        case policy = "Second course"
        case edtit = "Salad"
        case faq = "Snacks"
        case settings = "Baking"
        case liked = "Sauces"
        case drinks = "Drinks"
        case desetrs = "Desserts"
    }
    
    fileprivate enum MenuImage: String, CaseIterable {
        case terms = "aboutFood"
        case policy = "ZOJ"
        case edtit = "children"
        case faq = "meat"
        case settings = "frozen"
        case liked = "sous"
        case drinks = "drink"
        case desetrs = "desert"
    }
    
    var presenter: SearchPresenterProtocol?
    private let search = UISearchController()
    
    private lazy var filterButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 20
        let largeConfig = UIImage.SymbolConfiguration(weight: .bold)
        btn.setImage(UIImage(systemName: "list.dash", withConfiguration: largeConfig), for: .normal)
        btn.backgroundColor = .navigationBarColor
        btn.tintColor = .white
        btn.setTitle(" All filters", for: .normal)
        btn.titleLabel?.font = .semiBold16
        return btn
        
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let secondview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()
    }
    
    let array = [
        APIType.getSoup.request,
        APIType.getSecond.request,
        APIType.getSalad.request,
        APIType.getSnack.request,
        APIType.getBread.request,
        APIType.getSous.request,
        APIType.getDrinks.request,
        APIType.getDesserts.request
    ]
    
    func presentController(viewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}

extension SearchViewController: SearchViewProtocol {
}

private extension SearchViewController {
    func setupCollectionView() {
        var margis: CGFloat = 0
        if UIScreen.main.bounds.height >= 668 {
            margis = UIScreen.main.bounds.height / 22
        }
        
        view.addSubview(scrollView)
        scrollView.addSubview(secondview)
        secondview.addSubview(filterButton)
        secondview.addSubview(collectionView)
        
        collectionView.backgroundColor = .mainColor
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        
        
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(view.layoutMarginsGuide)
            make.width.equalTo(secondview.snp.width)
            make.height.equalTo(secondview.snp.height).inset(-margis)
        }
        
        secondview.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.snp.edges)
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(scrollView.snp.height).inset(margis)
        }
        
        filterButton.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(secondview).inset(20)
            make.height.equalTo(55)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leadingMargin.trailingMargin.equalTo(secondview)
            make.top.equalTo(filterButton.snp_bottomMargin).inset(-20)
            make.height.equalTo(scrollView.snp.height)
            make.width.equalTo(scrollView.snp.width)
        }
    }
    
    func setupView() {
        navigationItem.searchController = search
        search.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Search by retset and materials",
            attributes: [.foregroundColor: UIColor.searchTitleColor]
        )
        view.backgroundColor = .mainColor
        navigationItem.title = "Search"
    }
}

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.presentGeneric(request: array[indexPath.row])
    }
}

extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MenuOptions.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let image = UIImage(named: MenuImage.allCases[indexPath.row].rawValue) else { return UICollectionViewCell()}
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as! SearchCollectionViewCell
        cell.setupCell(image: image,
                       title: MenuOptions.allCases[indexPath.row].rawValue)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 2 - 17,
                      height: view.frame.size.width / 2 - 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
}
