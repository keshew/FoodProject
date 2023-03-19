import UIKit

protocol SoupPresenterProtocol: AnyObject {
    init(view: SoupViewProtocol, network: NetworkManagerProtocol, router: SoupRouterProtocol?)
    var viewModel: ProtocolSoupViewModel? { get set }
    func viewDidLoaded()
}

class SoupPresenter {
    weak var view: SoupViewProtocol?
    let network: NetworkManagerProtocol?
    var viewModel: ProtocolSoupViewModel?
    var router: SoupRouterProtocol?
    
    required init(view: SoupViewProtocol, network: NetworkManagerProtocol, router: SoupRouterProtocol?) {
        self.view = view
        self.network = network
        self.router = router
    }
    
    func viewDidLoaded() {
        self.viewModel = SoupViewModel()
        self.network?.getSoup(completion: { [weak self] salad in
            DispatchQueue.main.async {
                guard let self else { return }
                switch salad {
                case .success(let salad):
                    self.viewModel?.salads = salad
                    self.view?.sucsess()
                case .failure(let error):
                    self.view?.faillure(error: error)
                }
            }
        })
    }
}

extension SoupPresenter: SoupPresenterProtocol {
}
