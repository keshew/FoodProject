import UIKit

protocol Builder: AnyObject {
    func buildRead(router: ReadRouterProtocol) -> UIViewController
    func buildSearch(router: SearchRouterProtocol) -> UIViewController
    func buildSalad(router: SaladRouterProtocol) -> UIViewController
    func buildSoup(router: SoupRouterProtocol) -> UIViewController
    func buildDetail(id: Int, router: DetailRouterProtocol) -> UIViewController 
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
    
    func buildSalad(router: SaladRouterProtocol) -> UIViewController {
        let view = SaladViewController()
        let network = NetworkManager()
        let presenter = SaladPresenter(view: view, network: network, router: router)
        view.presenter = presenter
        return view
    }
    
    func buildSoup(router: SoupRouterProtocol) -> UIViewController {
        let view = SoupViewController()
        let network = NetworkManager()
        let presenter = SoupPresenter(view: view, network: network, router: router)
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
}
