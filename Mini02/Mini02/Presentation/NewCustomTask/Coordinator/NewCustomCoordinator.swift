import UIKit

class NewCustomCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = NewCustomTaskViewController()
        viewController.viewModel = NewCustomTaskViewViewModel(viewController: viewController)
        navigationController.pushViewController(viewController, animated: true)

//        viewController.modelView.coordinator = self

//        viewController.modelView.coordinator = self
    }
    
    
}
