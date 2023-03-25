import Foundation

protocol ProfileViewModelProtocol: AnyObject {
    static var shared: ProfileViewModel { get }
    init()
}

final class ProfileViewModel: ProfileViewModelProtocol {
    static var shared = ProfileViewModel()
    init() {}
}
