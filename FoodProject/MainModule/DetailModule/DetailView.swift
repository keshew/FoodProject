import UIKit
//rename all
class DetailView: UIView {
    
    private let willBeReadyIn: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Будет готово через"
        return name
    }()
    
    private let willBeReadyInTime: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "1111"
        return name
    }()
    
    private let inKitchen: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.text = "Время на кухне"
        name.translatesAutoresizingMaskIntoConstraints = false
        
        return name
    }()
    
    private let inKitchenTime: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "0000000"
        return name
    }()
    
    private lazy var barButton: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.setContentCompressionResistancePriority(.defaultHigh + 1, for: .vertical)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "35 people like this"
        return name
    }()
    
    private let likesNumber: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.setContentCompressionResistancePriority(.defaultHigh + 1, for: .vertical)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Number of likes"
        return name
    }()
    
    private lazy var firstStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [willBeReadyIn, willBeReadyInTime])
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var secondStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [inKitchen, inKitchenTime])
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var thirdStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [likesNumber, barButton])
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mainStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [firstStack, secondStack])
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkGray
        clipsToBounds = true
        layer.cornerRadius = 20
        addSubview(mainStack)
        addSubview(thirdStack)
        mainStack.snp.makeConstraints { make in
            make.topMargin.leadingMargin.trailingMargin.equalToSuperview()
        }
        thirdStack.snp.makeConstraints { make in
            make.topMargin.equalTo(mainStack.snp.bottomMargin).offset(10)
            make.bottomMargin.leadingMargin.equalToSuperview()
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(timeReady: String, timeInKitchen: String, numberOfLikes: String) {
        willBeReadyInTime.text = timeReady
        inKitchenTime.text = timeInKitchen
        barButton.text = numberOfLikes
    }
}
