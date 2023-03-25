import UIKit

protocol MainViewProtocol: AnyObject {
}

class MainViewController: UIViewController {
    
    var presenter: MainPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension MainViewController: MainViewProtocol {
}
