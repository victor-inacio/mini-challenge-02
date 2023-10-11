import UIKit

class StatisticMainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = StatisticViewController()
        controller.tabBarItem = UITabBarItem(title: "Statistics", image: .init(systemName: "star"), tag: 2)
        
        controller.viewModel = StatisticsViewModel()
        
        navigationController.pushViewController(controller, animated: true)
    }
}
