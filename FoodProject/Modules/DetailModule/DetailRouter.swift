import UIKit

protocol DetailRouterProtocol: AnyObject {
    func showDetail(id: Int)
}

class DetailRouter: DetailRouterProtocol {
    
    var navigationController: UINavigationController?
    var builder: Builder?
    
    init(navigationController: UINavigationController, builder: Builder) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func showDetail(id: Int) {
        if let navigationController = navigationController {
            guard let detailViewController = builder?.buildDetail(id: id, router: self) else { return }
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
}
