import UIKit

class AppMainCoordinator: Coordinator {
        
    var childCoordinators: [Coordinator] = []
    var tabBarController: UITabBarController
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    func start() {
    
        let vc2 = StatisticViewController()
        let vc3 = JournalViewController()
        
        let nav1 = UINavigationController()
        let homeCoordinator = HomeMainCoordinator(navigationController: nav1)
        childCoordinators.append(homeCoordinator)
        
        let nav2 = UINavigationController()
        let journalCoordinator = JournalMainCoordinator(navigationController: nav2)
        childCoordinators.append(journalCoordinator)
 
//        vc2.tabBarItem.title = "Journal"
//        vc2.tabBarItem.image = UIImage(systemName: "pencil")
//        let nav2 = UINavigationController(rootViewController: vc2)
        
        vc3.tabBarItem.title = "Statistic"
        vc3.tabBarItem.image = UIImage(systemName: "star.fill")
        let nav3 = UINavigationController(rootViewController: vc3)
        
        tabBarController.tabBar.backgroundColor = .systemGray
        tabBarController.tabBar.tintColor = .label
 
        tabBarController.setViewControllers([nav1, nav2], animated: true)
        
        // Inicializando todos os coordinatos
        // Cada coordinator faz o setup de uma view
        for coordinator in childCoordinators {
            coordinator.start()
        }
        
    }
}
