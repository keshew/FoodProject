import UIKit

protocol SearchRouterProtocol: AnyObject {
    func presentSalad() -> UIViewController
    func presentSoup() -> UIViewController
    func popToRoot()
}

class SearchRouter: SearchRouterProtocol {
    
    var navigationController: UINavigationController?
    var builder: Builder?
    
    init(navigationController: UINavigationController, builder: Builder) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = builder?.buildSearch(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    func presentSalad() -> UIViewController  {
        let navigationController = UINavigationController()
        guard let buider = builder else { return navigationController }
        let router = SaladRouter(navigationController: navigationController, builder: buider)
        return buider.buildSalad(router: router)
    }
    
    func presentSoup() -> UIViewController  {
        let navigationController = UINavigationController()
        guard let buider = builder else { return navigationController }
        let router = SoupRouter(navigationController: navigationController, builder: buider)
        return buider.buildSoup(router: router)
    }
}
