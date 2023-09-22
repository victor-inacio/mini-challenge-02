import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] {get set}
    func start() -> Void
}

// ViewModel da Home
class HomeViewModel: ViewModel {
    
    // Método para pegar todas as tasks da Model
    func getTasks() -> [String] {
        
        // getAll() é um método da Model Task
        return Task.getAll()
    }
}

class HomeMainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // O coordinator faz a HomeViewController aparecer na tela
    func start() {
        let controller = HomeViewController()
        // Ele diz qual é a model view da HomeViewController
        controller.modelView = HomeViewModel()
        
        // Faz a HomeViewController aparecer na tela
        navigationController.pushViewController(controller, animated: true)
    }
}

class AppMainCoordinator: Coordinator {
        
    var childCoordinators: [Coordinator] = []
    var tabBarController: UITabBarController
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    func start() {
    
        let vc2 = StatisticViewController()
        let vc3 = JournalViewController()
        
        // Setup do coordinator da Home
        let nav1 = UINavigationController()
        let homeCoordinator = HomeMainCoordinator(navigationController: nav1)
        childCoordinators.append(homeCoordinator)
//        
        vc2.tabBarItem.title = "Journal"
        vc2.tabBarItem.image = UIImage(systemName: "pencil")
        let nav2 = UINavigationController(rootViewController: vc2)
        
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
