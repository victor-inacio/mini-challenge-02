import UIKit

class CreateNewTaskCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = CreateNewTaskViewController()
        controller.modelView = CreateNewTaskViewModel(createNewTaskViewController: controller)
        controller.modelView.coordinator = self
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func returnToParent() {
        self.navigationController.popViewController(animated: true)
    }
}

