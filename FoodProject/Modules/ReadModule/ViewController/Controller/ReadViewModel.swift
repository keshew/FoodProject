import Foundation

protocol ProtocolReadViewModel: AnyObject {
    static var shared: ReadViewModel { get }
    init()
    var food: Food? { get set}
}

final class ReadViewModel: ProtocolReadViewModel {
    static var shared = ReadViewModel()
    init() {}
    var food: Food?
}
