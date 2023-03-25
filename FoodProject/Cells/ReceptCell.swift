import UIKit

class ReceptCell: UICollectionViewCell {
    
    static var identifier: String {
        String(describing: self)
    }
    
    private let imageOfRecept: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "loading")
        return image
    }()
    
    private let receptLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "RECEPT"
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.font = .medium11
        label.backgroundColor = .yellow
        label.textColor = .black
        return label
    }()
    
    private let nameOfRecept: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Loading..."
        label.font = .medium18
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageOfRecept, nameOfRecept])
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
    
    func setupCell(image: String?, title: String) {
        let placeholderImage = "https://wallpaperaccess.com/full/767277.jpg"
        imageOfRecept.kf.indicatorType = .activity
        imageOfRecept.kf.setImage(with: URL(string: image ?? placeholderImage))
        nameOfRecept.text = title
    }
}

private extension ReceptCell {
    func setupView() {
        contentView.addSubview(mainStackView)
        imageOfRecept.addSubview(receptLabel)
        
        mainStackView.snp.makeConstraints { make in
            make.topMargin.equalToSuperview().inset(10)
            make.trailingMargin.leadingMargin.bottomMargin.equalToSuperview()
        }
        
        receptLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.leadingMargin.equalToSuperview().inset(10)
            make.width.equalTo(60)
            make.height.equalTo(20)
        }
        
        imageOfRecept.snp.makeConstraints { make in
            make.height.equalTo(200)
        }
    }
}
