import UIKit

class HomeMainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = HomeViewController()
        controller.tabBarItem = UITabBarItem(title: "Home", image: .init(systemName: "gear"), tag: 0)
        controller.viewModel = HomeViewModel(HomeViewController: controller)
        controller.viewModel.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func goToCreateNewTask() {
        let coordinator = CreateNewTaskCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
}
