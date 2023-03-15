import UIKit

protocol SaladPresenterProtocol: AnyObject {
    init(view: SaladViewProtocol, network: NetworkManagerProtocol, router: SaladRouterProtocol?)
    var viewModel: ProtocolSaladViewModel? { get set }
    func viewDidLoaded()
}

class SaladPresenter {
    weak var view: SaladViewProtocol?
    let network: NetworkManagerProtocol?
    var viewModel: ProtocolSaladViewModel?
    var router: SaladRouterProtocol?
    
    required init(view: SaladViewProtocol, network: NetworkManagerProtocol, router: SaladRouterProtocol?) {
        self.view = view
        self.network = network
        self.router = router
    }
    
    func viewDidLoaded() {
        self.viewModel = SaladViewModel()
        self.network?.getSalad(completion: { [weak self] salad in
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

extension SaladPresenter: SaladPresenterProtocol {
}
