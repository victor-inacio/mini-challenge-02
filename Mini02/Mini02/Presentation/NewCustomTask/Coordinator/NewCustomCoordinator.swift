import UIKit

class NewCustomCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = NewJournalViewController()
        viewController.modelView = NewJournalViewModel(viewController: viewController)
//        viewController.modelView.coordinator = self

//        viewController.modelView.coordinator = self
    }
}
