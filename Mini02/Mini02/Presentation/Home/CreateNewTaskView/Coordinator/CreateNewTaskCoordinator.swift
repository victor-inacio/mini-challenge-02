import UIKit

class CreateNewTaskCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = CreateNewTaskViewController()
        let modelView = CreateNewTaskViewModel(createNewTaskViewController: controller, coordinator: self)
        controller.modelView = modelView
        navigationController.pushViewController(controller, animated: true)
    }
    
    func returnToParent() {
        self.navigationController.viewControllers.removeLast()
    }
}

