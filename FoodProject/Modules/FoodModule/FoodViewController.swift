import UIKit

protocol FoodViewProtocol: AnyObject {
    var collectionView: UICollectionView { get set }
    func sucsess()
    func faillure(error: Error)
}

final class FoodViewController: UIViewController, FoodViewProtocol {
    
    fileprivate enum UIConstants {
        static let widthDivide: CGFloat = 25
        static let halfDivide: CGFloat = 2
        static let heighthDivide: CGFloat = 85
        static let minimumLineSpacingForSectionAt: CGFloat = 5
    }

    var presenter: FoodPresenterProtocol?
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    private lazy var barButtonItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(goBack))
        item.tintColor = .orange
        return item
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewDidLoaded()
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

extension FoodViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let id = presenter?.viewModel?.salads?.results?[indexPath.row].id else { return }
        guard let controller = presenter?.didTapCell(id: id) else { return }
        let navigationController = UINavigationController(rootViewController: controller as! UIViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}

extension FoodViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.viewModel?.salads?.results?.count ?? 0 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReceptCell.identifier, for: indexPath) as? ReceptCell else { return UICollectionViewCell() }
        cell.setupCell(image: presenter?.viewModel?.salads?.results?[indexPath.row].image,
                       title: presenter?.viewModel?.salads?.results?[indexPath.row].title ?? "")
        return cell
    }
}

extension FoodViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width - UIScreen.main.bounds.width / UIConstants.widthDivide,
                      height: view.frame.size.width / UIConstants.halfDivide + UIConstants.heighthDivide)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return UIConstants.minimumLineSpacingForSectionAt
    }
}

private extension FoodViewController {
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
