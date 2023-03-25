import UIKit

protocol SearchPresenterProtocol: AnyObject {
    init(view: SearchViewProtocol, network: NetworkManagerProtocol, router: SearchRouterProtocol?)
    var viewModel: SearchViewModel? { get set }
    func presentGeneric(request: URLRequest)
    func popToRoot()
}

class SearchPresenter {
    weak var view: SearchViewProtocol?
    let network: NetworkManagerProtocol?
    var viewModel: SearchViewModel?
    var router: SearchRouterProtocol?

    required init(view: SearchViewProtocol, network: NetworkManagerProtocol, router: SearchRouterProtocol?) {
        self.view = view
        self.network = network
        self.router = router
    }
    
    func presentGeneric(request: URLRequest) {
        guard let router = router?.presentGeneric(request: request) else { return }
        router.modalPresentationStyle = .fullScreen
        view?.presentController(viewController: router)
    }
    
    @objc func popToRoot() {
        router?.popToRoot()
    }
}

extension SearchPresenter: SearchPresenterProtocol {
}
