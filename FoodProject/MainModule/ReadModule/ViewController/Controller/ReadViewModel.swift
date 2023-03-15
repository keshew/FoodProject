import Foundation

protocol ProtocolFoodViewModel: AnyObject {
    static var shared: FoodViewModel { get }
    init()
    var food: Food? { get set}
}

final class FoodViewModel: ProtocolFoodViewModel {
    static var shared = FoodViewModel()
    init() {}
    var food: Food?
}
