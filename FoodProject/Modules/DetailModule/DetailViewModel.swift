import Foundation

protocol DetailViewModelProtocol: AnyObject {
    static var shared: DetailViewModel { get }
    init()
    var detailViewModel: Recipe? { get set}
}

final class DetailViewModel: DetailViewModelProtocol {
    static var shared = DetailViewModel()
    init() {}
    var detailViewModel: Recipe?
}
