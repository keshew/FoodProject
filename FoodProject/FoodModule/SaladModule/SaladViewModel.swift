import Foundation

protocol ProtocolSaladViewModel: AnyObject {
    static var shared: SaladViewModel { get }
    init()
    var salads: Salad? { get set}
}

final class SaladViewModel: ProtocolSaladViewModel {
    static var shared = SaladViewModel()
    init() {}
    var salads: Salad?
}
