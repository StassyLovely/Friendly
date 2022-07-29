//import UIKit

//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//
//    var window: UIWindow?
//
//    private let storyboardName = "Main"
//    private let tabbarControllerIdentifier = "TabBarController"
//    
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        
//        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
//        let tabBarController = storyboard.instantiateViewController(identifier: tabbarControllerIdentifier)
//        let navigationController = UINavigationController(rootViewController: tabBarController)
//        
//        window = UIWindow(windowScene: windowScene)
//        window?.rootViewController = navigationController
//        window?.makeKeyAndVisible()
//    }
//}


//class TabBarViewController: UITabBarController {
//
//    static let tabBarVC = UITabBarController()
//    
//    static func initTabBar() -> UITabBarController {
//        
//        let homeVC = HomeViewController()
//        let profileVC = MentorsProfileViewController()
//
//        homeVC.title = "Главная"
//        profileVC.title = "Профиль"
//        
//        // Navigation
//        let homeNavController = UINavigationController(rootViewController: homeVC)
//        let profileNavController = UINavigationController(rootViewController: profileVC)
//        
//        let tabBarVC = UITabBarController()
//        tabBarVC.setViewControllers([homeNavController, profileNavController], animated: true)
//        
//        return tabBarVC
//    }
//}



//class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
//
//    let tabBarCnt = UITabBarController()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//    }
//
//    func tabBarSet() {
//
//    let firstVc = HomeViewController()
//    firstVc.title = "Home"
//    firstVc.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(named: "star"), tag: 0)
//
//    let secondVc = MentorsProfileViewController()
//    secondVc.title = "Profile"
//    secondVc.tabBarItem = UITabBarItem.init(title: "Profile", image: UIImage(named: "Location"), tag: 1)
//
//    let controllerArray = [firstVc, secondVc]
//    tabBarCnt.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
//
//    self.view.addSubview(tabBarCnt.view)
//}
//}
    
//        
//        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
//        self.delegate = self
//        
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        // Create Tab one
//        let tabOne = HomeViewController()
//        let tabOneBarItem = UITabBarItem(title: "Tab 1", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
//        
//        tabOne.tabBarItem = tabOneBarItem
//        
//        
//        // Create Tab two
//        let tabTwo = MentorsProfileViewController()
//        let tabTwoBarItem2 = UITabBarItem(title: "Tab 2", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
//        
//        tabTwo.tabBarItem = tabTwoBarItem2
//        
//        
//        self.viewControllers = [tabOne, tabTwo]
//    }
//    
//    // UITabBarControllerDelegate method
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        print("Selected \(viewController.title!)")
//    }
//}

//class TabBarController: UITabBarController, UITabBarControllerDelegate {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        delegate = self
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.selectedIndex = 0
//        let item1 = HomeViewController()
//        let item2 = MyMentorsProfileViewController()
//        let icon1 = UITabBarItem(title: "Title", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))
//        let icon2 = UITabBarItem(title: "Title", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))
//        item1.tabBarItem = icon1
//        item2.tabBarItem = icon2
//        let controllers = [item1, item2]  //array of the root view controllers displayed by the tab bar interface
//        self.viewControllers = controllers
//    }
//
//    //Delegate methods
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        print("Should select viewController: \(viewController.title ?? "") ?")
//        return true;
//    }
//}
//



