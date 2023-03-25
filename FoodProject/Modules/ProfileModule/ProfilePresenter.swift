import Foundation

protocol ProfilePresenterProtocol: AnyObject {
    init(view: ProfileViewProtocol, network: NetworkManagerProtocol, router: ProfileRouterProtocol?)
    var viewModel: ProfileViewModel? { get set }
}

class ProfilePresenter {
    weak var view: ProfileViewProtocol?
    let network: NetworkManagerProtocol?
    var viewModel: ProfileViewModel?
    var router: ProfileRouterProtocol?

    required init(view: ProfileViewProtocol, network: NetworkManagerProtocol, router: ProfileRouterProtocol?) {
        self.view = view
        self.network = network
        self.router = router
    }
}

extension ProfilePresenter: ProfilePresenterProtocol {
}
