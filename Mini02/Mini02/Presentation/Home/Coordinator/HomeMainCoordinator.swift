import UIKit

class HomeMainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var controller: HomeViewController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = HomeViewController()
        let tabBarItem = UITabBarItem(title: "Tarefas", image: UIImage(systemName: "list.bullet.rectangle.portrait"), selectedImage: UIImage(systemName: "list.bullet.rectangle.portrait.fill"))
        tabBarItem.tag = 0 

        controller.tabBarItem = tabBarItem

        controller.viewModel = HomeViewModel(HomeViewController: controller)
        controller.viewModel.coordinator = self
        self.controller = controller
        navigationController.pushViewController(controller, animated: true)
    }


    
    func goToCreateNewTask() {
        let coordinator = CreateNewTaskCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
}
