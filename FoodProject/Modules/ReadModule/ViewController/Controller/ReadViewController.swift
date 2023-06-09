import UIKit

protocol ReadViewProtocol: AnyObject {
    var collectionView: UICollectionView { get set }
    func sucsess()
    func faillure(error: Error)
}

final class ReadViewController: UIViewController, ReadViewProtocol {
    
    fileprivate enum MenuOptions: String, CaseIterable {
        case terms = "All about food"
        case policy = "Healthy lifestyle"
        case edtit = "Cooking for children"
        case faq = "Men's cuisine"
        case settings = "Blanks"
    }
    
    fileprivate enum MenuImage: String, CaseIterable {
        case terms = "aboutFood"
        case policy = "ZOJ"
        case edtit = "children"
        case faq = "meat"
        case settings = "frozen"
    }

    var presenter: ReadPresenterProtocol?
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
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
    
}

extension ReadViewController: UICollectionViewDelegate {
    
}

extension ReadViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MenuOptions.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let image = UIImage(named: MenuImage.allCases[indexPath.row].rawValue) else { return UICollectionViewCell()}
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReadCollectionViewCell.identifier, for: indexPath) as? ReadCollectionViewCell else { return UICollectionViewCell() }
        cell.setupCell(image: image,
                       title: MenuOptions.allCases[indexPath.row].rawValue)
        return cell
    }
}

extension ReadViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width - 40,
                      height: view.frame.size.width / 2 + 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}

private extension ReadViewController {
    func setupView() {
        navigationItem.title = "Read"
        view.addSubview(collectionView)
        collectionView.backgroundColor = .mainColor
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ReadCollectionViewCell.self, forCellWithReuseIdentifier: ReadCollectionViewCell.identifier)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
