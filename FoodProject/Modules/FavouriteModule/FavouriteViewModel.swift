import Foundation

protocol FavouriteViewModelProtocol: AnyObject {
    static var shared: FavouriteViewModel { get }
    init()
//    var FavouriteViewModel: NetworkModel? { get set}
}

final class FavouriteViewModel: FavouriteViewModelProtocol {
    static var shared = FavouriteViewModel()
    init() {}
//    var FavouriteViewModel: NetworkModel?
}
