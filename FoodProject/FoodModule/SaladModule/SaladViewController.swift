import UIKit

protocol SaladViewProtocol: AnyObject {
    var collectionView: UICollectionView { get set }
    func sucsess()
    func faillure(error: Error)
}

final class SaladViewController: UIViewController, SaladViewProtocol {

    var presenter: SaladPresenterProtocol?
    
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

extension SaladViewController: UICollectionViewDelegate {
    
}

extension SaladViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.viewModel?.salads?.results?.count ?? 0 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReadCollectionViewCell.identifier, for: indexPath) as? ReadCollectionViewCell else { return UICollectionViewCell() }
        cell.setupCell(image: presenter?.viewModel?.salads?.results?[indexPath.row].image,
                       title: presenter?.viewModel?.salads?.results?[indexPath.row].title ?? "")
        return cell
    }
}

extension SaladViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width - 40,
                      height: view.frame.size.width / 2 + 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}

private extension SaladViewController {
    func setupView() {
        navigationItem.rightBarButtonItem = barButtonItem
        view.addSubview(collectionView)
        collectionView.backgroundColor = .mainColor
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ReadCollectionViewCell.self, forCellWithReuseIdentifier: ReadCollectionViewCell.identifier)
        collectionView.frame = view.bounds
    }
}