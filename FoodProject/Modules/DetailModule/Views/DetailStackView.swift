import UIKit
//rename all
class DetailStackView: UIView {
    
    private let willBeReadyIn: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.font = .semiBold16
        return name
    }()
    
    private let willBeReadyInTime: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.font = .regular15
        return name
    }()
    
    private let inKitchen: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.font = .semiBold16
        return name
    }()
    
    private let inKitchenTime: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.font = .regular15
        return name
    }()
    
    private lazy var barButton: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.setContentCompressionResistancePriority(.defaultHigh + 1, for: .vertical)
        name.font = .regular15
        return name
    }()
    
    private let likesNumber: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.setContentCompressionResistancePriority(.defaultHigh + 1, for: .vertical)
        name.font = .semiBold16
        return name
    }()
    
    private lazy var firstStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [willBeReadyIn, willBeReadyInTime])
        view.spacing = 5
        view.axis = .vertical
        return view
    }()
    
    private lazy var secondStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [inKitchen, inKitchenTime])
        view.spacing = 5
        view.axis = .vertical
        return view
    }()
    
    private lazy var thirdStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [likesNumber, barButton])
        view.spacing = 5
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
            make.topMargin.equalTo(mainStack.snp.bottomMargin).inset(-20)
            make.leadingMargin.equalToSuperview().inset(10)
            make.bottomMargin.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(timeReady: String, timeInKitchen: String, numberOfLikes: String) {
        willBeReadyIn.text = "Will be ready in"
        likesNumber.text = "Number of likes"
        inKitchen.text = "Time in the kitchen"
        willBeReadyInTime.text = timeReady
        inKitchenTime.text = timeInKitchen
        barButton.text = numberOfLikes
    }
}
