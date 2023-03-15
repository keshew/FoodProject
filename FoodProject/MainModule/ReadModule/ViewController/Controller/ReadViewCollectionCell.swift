import UIKit
import SnapKit
import Kingfisher

class ReadCollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        String(describing: self)
    }
    
    private let titleLable: UILabelPadding = {
        let label = UILabelPadding()
        label.text = "Данные загружаются"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.backgroundColor = UIColor(red: 59/255, green: 59/255, blue: 59/255, alpha: 1)
        label.setContentCompressionResistancePriority(.defaultHigh + 1, for: .vertical)
        return label
    }()
    
    private let imageOfFood: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "loading")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageOfFood.image = nil
        titleLable.text = nil
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        let stackView = UIStackView(arrangedSubviews: [imageOfFood,titleLable])
        contentView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        
        stackView.layer.cornerRadius = 25
        stackView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview()
        }
        
        titleLable.snp.makeConstraints { make in
            make.height.equalTo(bounds.height / 5)
        }
    }
    
    func setupCell(image: String?, title: String) {
        let placeholderImage = "https://wallpaperaccess.com/full/767277.jpg"
        imageOfFood.kf.indicatorType = .activity
        imageOfFood.kf.setImage(with: URL(string: image ?? placeholderImage))
        titleLable.text = title
    }
}
