import UIKit

class ViewJournalCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    let journal: Journal
    
    init(journal: Journal, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.journal = journal
    }
    
    func start() {
        let controller = ViewJournalViewController()
        let viewModel = ViewJournalViewModel()
        controller.viewModel = viewModel
        controller.journal = journal
        navigationController.pushViewController(controller, animated: true)
    }
}
