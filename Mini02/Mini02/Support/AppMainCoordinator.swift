import UIKit

class AppMainCoordinator: Coordinator {
        
    var childCoordinators: [Coordinator] = []
    var tabBarController: UITabBarController
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    func start() {

        
        let nav1 = UINavigationController()
        let homeCoordinator = HomeMainCoordinator(navigationController: nav1)
        childCoordinators.append(homeCoordinator)
        
        let nav2 = UINavigationController()
        let journalCoordinator = JournalMainCoordinator(navigationController: nav2)
        childCoordinators.append(journalCoordinator)
        
        let nav3 = UINavigationController()
        let statisticCoordinator = StatisticMainCoordinator(navigationController: nav3)
        childCoordinators.append(statisticCoordinator)
        
        for coordinator in childCoordinators {
            coordinator.start()
        }
        
        tabBarController.tabBar.backgroundColor = .systemGray
        tabBarController.tabBar.tintColor = .label
 
        tabBarController.setViewControllers([nav1, nav2, nav3], animated: true)
        
        // Inicializando todos os coordinatos
        // Cada coordinator faz o setup de uma view
      
        
    }
}
