import Foundation

protocol MainPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, network: NetworkManagerProtocol, router: MainRouterProtocol?)
    var viewModel: MainViewModel? { get set }
}

class MainPresenter {
    weak var view: MainViewProtocol?
    let network: NetworkManagerProtocol?
    var viewModel: MainViewModel?
    var router: MainRouterProtocol?

    required init(view: MainViewProtocol, network: NetworkManagerProtocol, router: MainRouterProtocol?) {
        self.view = view
        self.network = network
        self.router = router
    }
}

extension MainPresenter: MainPresenterProtocol {
}
