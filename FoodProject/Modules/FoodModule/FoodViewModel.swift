import Foundation

protocol ProtocolFoodViewModel: AnyObject {
    static var shared: FoodViewModel { get }
    init()
    var salads: Salad? { get set}
}

final class FoodViewModel: ProtocolFoodViewModel {
    static var shared = FoodViewModel()
    init() {}
    var salads: Salad?
}
