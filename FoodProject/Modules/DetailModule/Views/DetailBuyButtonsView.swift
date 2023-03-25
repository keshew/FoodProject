import UIKit

class DetailBuyButtonsView: UIView {
    
    private let inListButton: UIButton = {
        let btn = UIButton()
        btn.layer.shadowColor = UIColor.green.cgColor
        btn.layer.shadowOffset = CGSize(width: 0.0, height: -2.0)
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowRadius = 10.0
        btn.layer.masksToBounds = false
        btn.layer.cornerRadius = 4.0
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 10
        btn.layer.borderColor = CGColor(red: 32/255, green: 191/255, blue: 61/255, alpha: 1)
        btn.layer.borderWidth = 1
        btn.tintColor = UIColor(cgColor: CGColor(red: 32/255, green: 191/255, blue: 61/255, alpha: 1))
        btn.setTitle("  In list", for: .normal)
        btn.titleLabel?.font = .medium13
        btn.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        btn.setTitleColor(UIColor(cgColor: CGColor(red: 32/255, green: 191/255, blue: 61/255, alpha: 1)), for: .normal)
        return btn
    }()
    
    private let inCartButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("  In cart", for: .normal)
        btn.setImage(UIImage(systemName: "cart"), for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 10
        btn.tintColor = .white
        btn.titleLabel?.font = .medium13
        btn.backgroundColor = UIColor(cgColor: CGColor(red: 32/255, green: 191/255, blue: 61/255, alpha: 1))
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [inListButton, inCartButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkGray
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
      addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(10)
        }
        
        inListButton.snp.makeConstraints { make in
            make.width.equalTo(120)
        }
    }
}
    
   
