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
        let favouriteRouter = FavouriteRouter(navigationController: navControl, builder: builder)
        let profileRouter = ProfileRouter(navigationController: navControl, builder: builder)
        let mainRouter = MainRouter(navigationController: navControl, builder: builder)
        
        setViewControllers([
            generateViewControllers(
                viewController: builder.buildMain(router: mainRouter),
                title: "Main",
                image: UIImage(systemName: "house.fill")
            ),
            generateViewControllers(
                viewController: builder.buildSearch(router: searchRouter),
                title: "Search",
                image: UIImage(systemName: "magnifyingglass")
            ),
            generateViewControllers(
                viewController: builder.buildRead(router: readRouter),
                title: "Read",
                image: UIImage(systemName: "book")
            ),
            generateViewControllers(
                viewController: builder.buildFavourite(router: favouriteRouter),
                title: "Favourite",
                image: UIImage(systemName: "heart")
            ),
            generateViewControllers(
                viewController: builder.buildProfile(router: profileRouter),
                title: "Profile",
                image: UIImage(systemName: "person")
            )],animated: true)
    }

    private func generateViewControllers(viewController: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image

        let appearcen = UINavigationBarAppearance()
        appearcen.configureWithOpaqueBackground()
        appearcen.backgroundColor = .navigationBarColor
        appearcen.titleTextAttributes = [.foregroundColor: UIColor.white]
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
