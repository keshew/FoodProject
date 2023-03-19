import Foundation

protocol DetailPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, network: NetworkManagerProtocol, router: DetailRouterProtocol?, id: Int?)
    func getInfo()
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
    
    func getInfo() {
        self.viewModel = DetailViewModel()
        self.network?.getCurrentRecept(id: id!, completion: { food in
            DispatchQueue.main.async {
                switch food {
                case .success(let foods):
                    self.viewModel?.detailViewModel = foods
                    self.view?.setupView(image: foods.image ?? "",
                                         title: foods.title ?? "",
                                         descriprion: foods.instructions ?? "")
                    self.view?.customView.setupView(timeReady: String(describing: foods.cookingMinutes ?? 0) + " minutes",
                                                    timeInKitchen: String(describing: foods.cookingMinutes ?? 0) + " minutes",
                                                    numberOfLikes: String(describing: foods.aggregateLikes ?? 0) + " people like this")
                    self.view?.sucsess()
                case .failure(let error):
                    print(error)
                }
            }
        })
    }
}

extension DetailPresenter: DetailPresenterProtocol {
}
