//
//  ReceptCell.swift
//  FoodProject
//
//  Created by Артём Коротков on 15.03.2023.
//

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
    
    private let imageOfTime: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "timer")
        return image
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "1.23 gour"
        label.textColor = UIColor(cgColor: CGColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1))
        return label
    }()
    
    private let nameOfRecept: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Loading..."
        label.font = .preferredFont(forTextStyle: .headline)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var timeStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageOfTime, timeLabel])
        stack.spacing = 10
        return stack
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageOfRecept, nameOfRecept])
        stack.axis = .vertical
        stack.spacing = 10
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
    
    func setupCell(image: String?, title: String, time: String) {
        let placeholderImage = "https://wallpaperaccess.com/full/767277.jpg"
        imageOfRecept.kf.indicatorType = .activity
        imageOfRecept.kf.setImage(with: URL(string: image ?? placeholderImage))
        nameOfRecept.text = title
        timeLabel.text = time
    }
}

private extension ReceptCell {
    func setupView() {
        contentView.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        imageOfTime.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
    }
}
