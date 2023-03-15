import UIKit

final class TabBarViewController: UITabBarController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        let navControl = UINavigationController()
        let builder = ModuleBuilder()
        let readRouter = ReadRouter(navigationController: navControl, builder: builder)
        let searchRouter = SearchRouter(navigationController: navControl, builder: builder)
        
        setViewControllers([
            generateViewControllers(
                viewController: builder.buildSearch(router: searchRouter),
                title: "Поиск",
                image: UIImage(systemName: "magnifyingglass")
            ),
            generateViewControllers(
                viewController: builder.buildRead(router: readRouter),
                title: "Почитать",
                image: UIImage(systemName: "book")
            )],animated: true)
    }

    private func generateViewControllers(viewController: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image

        let appearcen = UINavigationBarAppearance()
        appearcen.configureWithOpaqueBackground()
        appearcen.backgroundColor = .navigationBarColor
        appearcen.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.backgroundColor = .navigationBarColor
        navigationController.navigationBar.scrollEdgeAppearance = appearcen
        navigationController.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .mainColor
        return navigationController
    }
    
    private func setTabBarAppearance() {
        tabBar.itemPositioning = .centered
        tabBar.tintColor = .selectedItemTabBarColor
        tabBar.unselectedItemTintColor = .unselectedItemTabBarColor
    }
}
