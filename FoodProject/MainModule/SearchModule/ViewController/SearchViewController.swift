//import UIKit
//
//protocol SearchViewProtocol: AnyObject {
//    func presentController(viewController: UIViewController)
//}
//
//class SearchViewController: UIViewController {
//
//    fileprivate enum MenuOptions: String, CaseIterable {
//        case terms = "Первые блюда"
//        case policy = "Вторые блюда"
//        case edtit = "Салаты"
//        case faq = "Закуски"
//        case settings = "Выпечка"
//        case liked = "Соусы"
//        case drinks = "Напитки"
//        case desetrs = "Десерты"
//    }
//
//    fileprivate enum MenuImage: String, CaseIterable {
//        case terms = "first"
//        case policy = "second"
//        case edtit = "salat"
//        case faq = "zakuska"
//        case settings = "bread"
//        case liked = "sous"
//        case drinks = "drink"
//        case desetrs = "desert"
//    }
//
//    var presenter: SearchPresenterProtocol?
//    private let search = UISearchController()
//
//    private let filterButton: UIButton = {
//        let btn = UIButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.clipsToBounds = true
//        btn.layer.cornerRadius = 20
//        btn.setImage(UIImage(systemName: "list.dash"), for: .normal)
//        btn.backgroundColor = .navigationBarColor
//        btn.tintColor = .white
//        btn.setTitle("  Все фильтры", for: .normal)
//        return btn
//
//    }()
//
//    private let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        return view
//    }()
//
//    private lazy var scrollView: UIScrollView = {
//        let scroll = UIScrollView()
//        scroll.translatesAutoresizingMaskIntoConstraints = false
//        return scroll
//    }()
//
//    private let secondview: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupView()
//        setupCollectionView()
//    }
//
//    func presentController(viewController: UIViewController) {
//        let navigationController = UINavigationController(rootViewController: viewController)
//        navigationController.modalPresentationStyle = .fullScreen
//        present(navigationController, animated: true)
//    }
//}
//
//extension SearchViewController: SearchViewProtocol {
//}
//
//private extension SearchViewController {
//    func setupCollectionView() {
//        view.addSubview(collectionView)
//        collectionView.backgroundColor = .mainColor
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
//        collectionView.snp.makeConstraints { make in
//            make.top.equalTo(filterButton).inset(70)
//            make.leading.equalToSuperview()
//            make.trailing.equalToSuperview()
//            make.bottom.equalToSuperview()
//        }
//    }
//
//    func setupView() {
//        navigationItem.searchController = search
//        search.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
//            string: "Поиск по рецетам и материалам",
//            attributes: [.foregroundColor: UIColor.searchTitleColor]
//        )
//        view.backgroundColor = .mainColor
//        title = "Поиск"
//
//        view.addSubview(filterButton)
//        filterButton.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
//            make.leading.trailing.equalToSuperview().inset(20)
//            make.height.equalTo(50)
//        }
//    }
//}
//
//extension SearchViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        switch indexPath.row {
//        case 0: presenter?.presentSoup()
//        case 2: presenter?.presentSalad()
//
//        default:
//            print("lmap")
//        }
//    }
//}
//
//extension SearchViewController: UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        MenuOptions.allCases.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as! SearchCollectionViewCell
//        cell.setupCell(image: UIImage(named: MenuImage.allCases[indexPath.row].rawValue)!, title: MenuOptions.allCases[indexPath.row].rawValue)
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
//    }
//}
//
//extension SearchViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.size.width / 2 - 20,
//                      height: view.frame.size.width / 2 - 70)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//
//}


import UIKit

protocol SearchViewProtocol: AnyObject {
    func presentController(viewController: UIViewController)
}

class SearchViewController: UIViewController {
    
    fileprivate enum MenuOptions: String, CaseIterable {
        case terms = "Первые блюда"
        case policy = "Вторые блюда"
        case edtit = "Салаты"
        case faq = "Закуски"
        case settings = "Выпечка"
        case liked = "Соусы"
        case drinks = "Напитки"
        case desetrs = "Десерты"
    }
    
    fileprivate enum MenuImage: String, CaseIterable {
        case terms = "first"
        case policy = "second"
        case edtit = "salat"
        case faq = "zakuska"
        case settings = "bread"
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
        btn.setImage(UIImage(systemName: "list.dash"), for: .normal)
        btn.backgroundColor = .navigationBarColor
        btn.tintColor = .white
        btn.setTitle("  Все фильтры", for: .normal)
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
        //
        var margis: CGFloat = 0
        if UIScreen.main.bounds.height >= 668 {
            margis = UIScreen.main.bounds.height / 22
        }
        
        view.addSubview(scrollView)
        scrollView.addSubview(secondview)
        secondview.addSubview(filterButton)
        secondview.addSubview(collectionView)
        //
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
            make.leading.trailing.equalTo(secondview)
            make.top.equalTo(filterButton.snp_bottomMargin).inset(-20)
            make.height.equalTo(scrollView.snp.height)
            make.width.equalTo(scrollView.snp.width)
        }
    }
    
    func setupView() {
        navigationItem.searchController = search
        search.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Поиск по рецетам и материалам",
            attributes: [.foregroundColor: UIColor.searchTitleColor]
        )
        view.backgroundColor = .mainColor
        title = "Поиск"
    }
}

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: presenter?.presentSoup()
        case 2: presenter?.presentSalad()
        
        default:
            print("lmap")
        }
    }
}

extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MenuOptions.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as! SearchCollectionViewCell
        cell.setupCell(image: UIImage(named: MenuImage.allCases[indexPath.row].rawValue)!, title: MenuOptions.allCases[indexPath.row].rawValue)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 2 - 15,
                      height: view.frame.size.width / 2 - 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
