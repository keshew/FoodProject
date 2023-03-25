import UIKit

class ProfileView: UIView {
    
    private let enterImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.circle.fill")
        image.tintColor = .darkGray
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
        let stack = UIStackView(arrangedSubviews: [titleLogin,loginButton])
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

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(enterImage)
        addSubview(stack)
        addSubview(stack2)
        
        enterImage.snp.makeConstraints { make in
            make.topMargin.equalToSuperview().inset(10)
            make.leading.equalTo(UIScreen.main.bounds.width / 3.5)
            make.bottomMargin.equalTo(stack.snp.topMargin).inset(-20)
        }
        
        stack.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
        }
        
        stack2.snp.makeConstraints { make in
            make.horizontalEdges.bottomMargin.equalToSuperview()
            make.topMargin.equalTo(stack.snp.bottomMargin).inset(-20)
        }
        
        enterImage.snp.makeConstraints { make in
//            make.size.equalTo(50)
            make.width.equalTo(90)
        }
    }
}
