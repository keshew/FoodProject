import UIKit

protocol SearchRouterProtocol: AnyObject {
    func presentGeneric(request: URLRequest) -> UIViewController
    func popToRoot()
}

class SearchRouter: SearchRouterProtocol {
    
    var navigationController: UINavigationController?
    var builder: Builder?
    
    init(navigationController: UINavigationController, builder: Builder) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func presentGeneric(request: URLRequest) -> UIViewController  {
        let navigationController = UINavigationController()
        guard let buider = builder else { return navigationController }
        let router = FoodRouter(navigationController: navigationController, builder: buider)
        return buider.buildFood(request: request, router: router)
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
}
