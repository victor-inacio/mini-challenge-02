import UIKit

class CreateNewTaskCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = CreateNewTaskViewController()
        controller.viewModel = CreateNewTaskViewModel(createNewTaskViewController: controller)
        controller.viewModel.coordinator = self
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func returnToParent() {
        self.navigationController.popViewController(animated: true)
    }
    
    func goToNewCustomView() {
        let coordinator = NewCustomCoordinator(navigationController: self.navigationController)
        coordinator.start()

    }
}

