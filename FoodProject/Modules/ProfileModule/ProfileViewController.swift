import UIKit

protocol ProfileViewProtocol: AnyObject {
}

class ProfileViewController: UIViewController {
    
    let GroupSection = ["Personal","Food.ru"]
    
    let itemsInfoArrays = [
        ["My recipes", "Shopping list", "Cart"],
        ["Settings","What is Food.ru?","Terms of Use","Privacy policy","Write to support",]]
    
    
    var presenter: ProfilePresenterProtocol?
    
    private lazy var profileView: ProfileView = {
        let view = ProfileView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    private let versionLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.font = .regular10
        view.text = "App version: 01.20.03"
        return view
    }()
    
    private let justView = UIView()
    
    private lazy var myTable: AutoSizing = {
        let table = AutoSizing()
        table.backgroundColor = .mainColor
        table.dataSource = self
        table.delegate = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.showsVerticalScrollIndicator = false
        table.isScrollEnabled = false
        table.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        table.separatorColor = .gray
        table.register(UITableViewCell.self, forCellReuseIdentifier: "priv")
        return table
    }()
 
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension ProfileViewController: ProfileViewProtocol {
}

private extension ProfileViewController {
    func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(justView)
        justView.addSubview(myTable)
        justView.addSubview(profileView)
        justView.addSubview(versionLabel)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(justView.snp.width)
        }
        
        justView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
        }
        
        profileView.snp.makeConstraints { make in
            make.topMargin.equalToSuperview()
            make.height.equalTo(240)
            make.horizontalEdges.equalToSuperview().inset(40)
        }
        
        versionLabel.snp.makeConstraints { make in
            make.bottomMargin.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(40)
        }
        
        myTable.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottomMargin.equalTo(versionLabel.snp.topMargin).inset(-40)
            make.topMargin.equalTo(profileView.snp.bottomMargin).inset(-10)
        }
        
        
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return GroupSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsInfoArrays[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "priv", for: indexPath)
        cell.backgroundColor = UIColor(cgColor: CGColor(red: 59/255, green: 59/255, blue: 59/255, alpha: 1))
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = itemsInfoArrays[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.GroupSection[section]
        return section
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor(cgColor: CGColor(red: 59/255, green: 59/255, blue: 59/255, alpha: 1))
        header.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 14)
    }
}
