import UIKit
//rename all
class DetailView: UIView {
    
    private let willBeReadyIn: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.text = "Will be ready in"
        name.font = .systemFont(ofSize: 15, weight: .semibold)
        return name
    }()
    
    private let willBeReadyInTime: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.font = .systemFont(ofSize: 12, weight: .regular)
        name.text = ""
        return name
    }()
    
    private let inKitchen: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.text = "Time in the kitchen"
        name.font = .systemFont(ofSize: 15, weight: .bold)
        return name
    }()
    
    private let inKitchenTime: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.text = ""
        name.font = .systemFont(ofSize: 12, weight: .regular)
        return name
    }()
    
    private lazy var barButton: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.setContentCompressionResistancePriority(.defaultHigh + 1, for: .vertical)
        name.text = ""
        name.font = .systemFont(ofSize: 12, weight: .regular)
        return name
    }()
    
    private let likesNumber: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.setContentCompressionResistancePriority(.defaultHigh + 1, for: .vertical)
        name.font = .systemFont(ofSize: 15, weight: .bold)
        name.text = "Number of likes"
        return name
    }()
    
    private lazy var firstStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [willBeReadyIn, willBeReadyInTime])
        view.axis = .vertical
        return view
    }()
    
    private lazy var secondStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [inKitchen, inKitchenTime])
        view.axis = .vertical
        return view
    }()
    
    private lazy var thirdStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [likesNumber, barButton])
        view.axis = .vertical
        return view
    }()
    
    private lazy var mainStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [firstStack, secondStack])
        view.spacing = 10
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
            make.topMargin.equalToSuperview()
            make.leadingMargin.trailingMargin.equalToSuperview().inset(10)
        }
        thirdStack.snp.makeConstraints { make in
            make.topMargin.equalTo(mainStack.snp.bottomMargin).offset(10)
            make.leadingMargin.equalToSuperview().inset(10)
            make.bottomMargin.equalToSuperview()
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
