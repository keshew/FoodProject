import UIKit

protocol SoupViewProtocol: AnyObject {
    var collectionView: UICollectionView { get set }
    func sucsess()
    func faillure(error: Error)
}

final class SoupViewController: UIViewController, SoupViewProtocol {

    var presenter: SoupPresenterProtocol?
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    private lazy var barButtonItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "Отменить", style: .done, target: self, action: #selector(goBack))
        item.tintColor = .orange
        return item
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewDidLoaded()
        let appearcen = UINavigationBarAppearance()
        appearcen.configureWithOpaqueBackground()
        appearcen.backgroundColor = .navigationBarColor
        navigationController!.navigationBar.scrollEdgeAppearance = appearcen
    }
    
    func sucsess() {
        self.collectionView.reloadData()
    }
    
    func faillure(error: Error) {
        //make alert
        print("Error is", error)
    }
    
    @objc func goBack() {
        dismiss(animated: true)
    }
    
}

extension SoupViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(presenter?.viewModel?.salads?.results?[indexPath.row].id)
        //presenter-router
        let nav = UINavigationController()
        let builder = ModuleBuilder()
        let router = DetailRouter(navigationController: nav, builder: builder)
        let test = builder.buildDetail(id: (presenter?.viewModel?.salads?.results?[indexPath.row].id)!, router: router)
        let controller = UINavigationController(rootViewController: test)
        controller.modalPresentationStyle = .fullScreen
        
        present(controller, animated: true)
    }
}

extension SoupViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.viewModel?.salads?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReceptCell.identifier, for: indexPath) as? ReceptCell else { return UICollectionViewCell() }
        cell.setupCell(image: presenter?.viewModel?.salads?.results?[indexPath.row].image,
                       title: presenter?.viewModel?.salads?.results?[indexPath.row].title ?? "", time: String(describing: (presenter?.viewModel?.salads?.results?[indexPath.row].readyInMinutes) ?? 0))
        return cell
    }
}

extension SoupViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width - UIScreen.main.bounds.width / 25,
                      height: view.frame.size.width / 2 + 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

private extension SoupViewController {
    func setupView() {
        navigationItem.rightBarButtonItem = barButtonItem
        view.addSubview(collectionView)
        collectionView.backgroundColor = .mainColor
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ReceptCell.self, forCellWithReuseIdentifier: ReceptCell.identifier)
        collectionView.frame = view.bounds
    }
}
