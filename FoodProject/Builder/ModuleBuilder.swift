import UIKit

protocol Builder: AnyObject {
    func buildRead(router: ReadRouterProtocol) -> UIViewController
    func buildSearch(router: SearchRouterProtocol) -> UIViewController
    func buildFood(request: URLRequest, router: FoodRouterProtocol) -> UIViewController
    func buildDetail(id: Int, router: DetailRouterProtocol) -> UIViewController
    func buildFavourite(router: FavouriteRouterProtocol) -> UIViewController
    func buildProfile(router: ProfileRouterProtocol) -> UIViewController
    func buildMain(router: MainRouterProtocol) -> UIViewController
}
class ModuleBuilder: Builder { 
    func buildRead(router: ReadRouterProtocol) -> UIViewController {
        let view = ReadViewController()
        let network = NetworkManager()
        let presenter = ReadPresenter(view: view, network: network, router: router)
        view.presenter = presenter
        return view
    }
    
    func buildSearch(router: SearchRouterProtocol) -> UIViewController {
        let view = SearchViewController()
        let network = NetworkManager()
        let presenter = SearchPresenter(view: view, network: network, router: router)
        view.presenter = presenter
        return view
    }
    
    func buildFood(request: URLRequest, router: FoodRouterProtocol) -> UIViewController {
        let view = FoodViewController()
        let network = NetworkManager()
        let presenter = FoodPresenter(view: view, network: network, router: router, request: request)
        view.presenter = presenter
        return view
    }
    
    func buildDetail(id: Int, router: DetailRouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let network = NetworkManager()
        let presenter = DetailPresenter(view: view, network: network, router: router, id: id)
        view.presenter = presenter
        return view
    }
    
    func buildFavourite(router: FavouriteRouterProtocol) -> UIViewController {
        let view = FavouriteViewController()
        let network = NetworkManager()
        let presenter = FavouritePresenter(view: view, network: network, router: router)
        view.presenter = presenter
        return view
    }
    
    func buildProfile(router: ProfileRouterProtocol) -> UIViewController {
        let view = ProfileViewController()
        let network = NetworkManager()
        let presenter = ProfilePresenter(view: view, network: network, router: router)
        view.presenter = presenter
        return view
    }
    
    func buildMain(router: MainRouterProtocol) -> UIViewController {
        let view = MainViewController()
        let network = NetworkManager()
        let presenter = MainPresenter(view: view, network: network, router: router)
        view.presenter = presenter
        return view
    }
}
