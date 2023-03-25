import Foundation

protocol FavouritePresenterProtocol: AnyObject {
    init(view: FavouriteViewProtocol, network: NetworkManagerProtocol, router: FavouriteRouterProtocol?)
    var viewModel: FavouriteViewModel? { get set }
}

class FavouritePresenter {
    weak var view: FavouriteViewProtocol?
    let network: NetworkManagerProtocol?
    var viewModel: FavouriteViewModel?
    var router: FavouriteRouterProtocol?

    required init(view: FavouriteViewProtocol, network: NetworkManagerProtocol, router: FavouriteRouterProtocol?) {
        self.view = view
        self.network = network
        self.router = router
    }
}

extension FavouritePresenter: FavouritePresenterProtocol {
}
