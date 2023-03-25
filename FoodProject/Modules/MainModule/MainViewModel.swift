import Foundation

protocol MainViewModelProtocol: AnyObject {
    static var shared: MainViewModel { get }
    init()
//    var MainViewModel: NetworkModel? { get set}
}

final class MainViewModel: MainViewModelProtocol {
    static var shared = MainViewModel()
    init() {}
//    var MainViewModel: NetworkModel?
}
