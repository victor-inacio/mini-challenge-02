import UIKit

class StatisticMainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = StatisticViewController()
        controller.tabBarItem = UITabBarItem(title: "Statistics", image: UIImage(systemName: "chart.bar"), selectedImage: UIImage(systemName: "chart.bar.fill"))

        controller.viewModel = StatisticsViewModel()

        navigationController.pushViewController(controller, animated: true)
    }

}
