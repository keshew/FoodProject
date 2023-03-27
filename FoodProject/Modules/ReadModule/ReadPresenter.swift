import UIKit

protocol ReadPresenterProtocol: AnyObject {
    init(view: ReadViewProtocol, network: NetworkManagerProtocol, router: ReadRouterProtocol?)
    var viewModel: ProtocolReadViewModel? { get set }
    func viewDidLoaded()
}

class ReadPresenter {
    weak var view: ReadViewProtocol?
    let network: NetworkManagerProtocol?
    var viewModel: ProtocolReadViewModel?
    var router: ReadRouterProtocol?
    
    required init(view: ReadViewProtocol, network: NetworkManagerProtocol, router: ReadRouterProtocol?) {
        self.view = view
        self.network = network
        self.router = router
    }
    
    func viewDidLoaded() {
        self.viewModel = ReadViewModel()
//        self.network?.getFood(completion: { [weak self] food in
//            DispatchQueue.main.async {
//                guard let self else { return }
//                switch food {
//                case .success(let foods):
//                    self.viewModel?.food = foods
//                    self.view?.sucsess()
//                case .failure(let error):
//                    self.view?.faillure(error: error)
//                }
//            }
//        })
    }
}

extension ReadPresenter: ReadPresenterProtocol {
}
