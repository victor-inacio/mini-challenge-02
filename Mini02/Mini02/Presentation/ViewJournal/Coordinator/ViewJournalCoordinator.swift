import UIKit

class ViewJournalCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = ViewJournalViewController()
        let viewModel = ViewJournalViewModel()
        controller.viewModel = viewModel
        
        navigationController.pushViewController(controller, animated: true)
    }
}
