import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        String(describing: self)
    }
    
    private let imageOfFood: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()
    
    private let nameOfBlock: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 5
        return label

    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(imageOfFood)
        contentView.addSubview(nameOfBlock)
        
        nameOfBlock.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.bottom.equalTo(imageOfFood).inset(10)
        }
        
        imageOfFood.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setupCell(image: UIImage, title: String) {
        imageOfFood.image = image
        nameOfBlock.text = title
    }
}
