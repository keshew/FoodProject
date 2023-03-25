import UIKit

protocol FavouriteViewProtocol: AnyObject {
}

class FavouriteViewController: UIViewController {
    
    private let enterImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "loginAcc")
        return image
    }()
    
    private let titleLogin: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.font = .regular14
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Favorites are only available to authorized users"
        return label
    }()
    
    private let firstPathAgree: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "By clicking «‎Log in‎»‎ you accept"
        label.font = .regular10
        return label
    }()
    
    private let secondPathAgree: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Terms of Use Food.ru"
        label.font = .regular10
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = .semiBold16
        btn.setTitle("Log in", for: .normal)
        btn.backgroundColor = .yellow
        btn.setTitleColor(.black, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 15
        return btn
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [enterImage,titleLogin,loginButton])
        stack.axis = .vertical
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var stack2: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [firstPathAgree,secondPathAgree])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var presenter: FavouritePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension FavouriteViewController: FavouriteViewProtocol {
}

private extension FavouriteViewController {
    func setupView() {
        title = "Favourite"
        view.addSubview(stack)
        view.addSubview(stack2)
        stack.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.centerY.equalToSuperview()
        }
        
        enterImage.snp.makeConstraints { make in
            make.height.equalTo(120)
        }
        
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        stack2.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottomMargin.equalToSuperview().inset(10)
        }
    }
}
