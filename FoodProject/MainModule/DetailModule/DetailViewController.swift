import UIKit

protocol DetailViewProtocol: AnyObject {
    
}

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        var net = presenter?.id
        title = "DetailModule = \(net)"
    }

 
}

extension DetailViewController: DetailViewProtocol {
}
