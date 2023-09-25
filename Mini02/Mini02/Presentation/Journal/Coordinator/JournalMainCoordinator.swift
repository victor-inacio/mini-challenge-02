import UIKit

class JournalMainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = JournalViewController()
        
        controller.modelView = JournalViewModel()
        
        navigationController.pushViewController(controller, animated: true)
    }
}
