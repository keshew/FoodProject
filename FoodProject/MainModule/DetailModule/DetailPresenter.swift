import Foundation

protocol DetailPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, network: NetworkManagerProtocol, router: DetailRouterProtocol?, id: Int?)
    var viewModel: DetailViewModel? { get set }
    var id: Int? { get set }
}

class DetailPresenter {
    weak var view: DetailViewProtocol?
    let network: NetworkManagerProtocol?
    var viewModel: DetailViewModel?
    var router: DetailRouterProtocol?
    var id: Int?

    required init(view: DetailViewProtocol, network: NetworkManagerProtocol, router: DetailRouterProtocol?, id: Int?) {
        self.view = view
        self.network = network
        self.router = router
        self.id = id
    }
}

extension DetailPresenter: DetailPresenterProtocol {
}
