import Foundation

protocol DetailViewModelProtocol: AnyObject {
    static var shared: DetailViewModel { get }
    init()
//    var DetailViewModel: NetworkModel? { get set}
}

final class DetailViewModel: DetailViewModelProtocol {
    static var shared = DetailViewModel()
    init() {}
//    var DetailViewModel: NetworkModel?
}
