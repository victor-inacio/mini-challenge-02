import UIKit

class JournalMainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = JournalList()
        controller.tabBarItem = UITabBarItem(title: "Journal", image: .init(systemName: "pencil"), tag: 1)
        controller.viewModel = JournalViewModel()
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func toNewJournal() {
        let cordinador = NewJournalMainCoordinator(navigationController: self.navigationController)
        cordinador.start()
    }
}
