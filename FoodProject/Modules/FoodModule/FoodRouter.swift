import UIKit

protocol FoodRouterProtocol: AnyObject {
    func buildDetail(id: Int) -> UIViewController
}

class FoodRouter: FoodRouterProtocol {
    
    var navigationController: UINavigationController?
    var builder: Builder?
    
    init(navigationController: UINavigationController, builder: Builder) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func buildDetail(id: Int) -> UIViewController {
        let nav = UINavigationController()
        let builder = ModuleBuilder()
        let router = DetailRouter(navigationController: nav, builder: builder)
        return builder.buildDetail(id: id, router: router)
    }
}
