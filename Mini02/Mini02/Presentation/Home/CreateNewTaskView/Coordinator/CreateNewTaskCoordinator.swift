import UIKit

class CreateNewTaskCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = CreateNewTaskViewController()
        controller.modelView = CreateNewTaskViewModel(createNewTaskViewController: controller, coordinator: self)
        navigationController.pushViewController(controller, animated: true)
    }
}

