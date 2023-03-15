import Foundation

protocol ProtocolSoupViewModel: AnyObject {
    static var shared: SoupViewModel { get }
    init()
    var salads: Salad? { get set}
}

final class SoupViewModel: ProtocolSoupViewModel {
    static var shared = SoupViewModel()
    init() {}
    var salads: Salad?
}
