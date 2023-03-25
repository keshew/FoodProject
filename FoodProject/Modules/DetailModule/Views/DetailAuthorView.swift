import UIKit

class DetailAuthorView: UIView {
    
    private let authorImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logoSpun")
        image.layer.cornerRadius = 35 / 2
        image.clipsToBounds = true
        return image
    }()
    
    private let authorLabel: UILabel = {
        let name = UILabel()
        name.text = "Author:   "
        name.textColor = .white
        name.font = .regular14
        return name
    }()
    
    private let authorNameLabel: UILabel = {
        let name = UILabel()
        name.text = "Spoonacular.com"
        name.textColor = .white
        name.font = .medium13
        return name
    }()
    
    private let descriptionLabel: UILabel = {
        let name = UILabel()
        name.font = .regular10
        name.textColor = .white
        name.text = "Food service API"
        return name
    }()
    
    private lazy var authorStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [authorLabel,authorNameLabel])
        stack.axis = .horizontal
        return stack
    }()
    
    private lazy var labelsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [authorStack,descriptionLabel])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 5
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkGray
        clipsToBounds = true
        layer.cornerRadius = 20
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(labelsStack)
        addSubview(authorImage)
        labelsStack.snp.makeConstraints { make in
            make.topMargin.bottomMargin.equalToSuperview()
            make.trailingMargin.equalToSuperview().inset(40)
        }
        
        authorImage.snp.makeConstraints { make in
            make.size.equalTo(35)
            make.leadingMargin.equalToSuperview().inset(10)
            make.topMargin.equalToSuperview().inset(8)
            make.trailingMargin.equalTo(labelsStack.snp.leadingMargin).inset(-25)
        }
    }
}
    
   
