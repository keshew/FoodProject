import Foundation

protocol FoodPresenterProtocol: AnyObject {
    init(view: FoodViewProtocol, network: NetworkManagerProtocol, router: FoodRouterProtocol?, request: URLRequest?)
    var viewModel: ProtocolFoodViewModel? { get set }
    func viewDidLoaded()
    func didTapCell(id: Int) -> Any?
    var request: URLRequest? { get set }
}

class FoodPresenter {
    weak var view: FoodViewProtocol?
    let network: NetworkManagerProtocol?
    var viewModel: ProtocolFoodViewModel?
    var router: FoodRouterProtocol?
    var request: URLRequest?
    
    required init(view: FoodViewProtocol, network: NetworkManagerProtocol, router: FoodRouterProtocol?, request: URLRequest?) {
        self.view = view
        self.network = network
        self.router = router
        self.request = request
    }
    
    func didTapCell(id: Int) -> Any? {
        guard let controller = router?.buildDetail(id: id) else { return nil }
        return controller
    }
    
    func viewDidLoaded() {
        self.viewModel = FoodViewModel()
        self.network?.getGeneric(path: request!, completion: { [weak self] sous in
            DispatchQueue.main.async {
                guard let self else { return }
                switch sous {
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

extension FoodPresenter: FoodPresenterProtocol {
}
