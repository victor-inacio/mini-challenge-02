import UIKit

class JournalMainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let controller = JournalList()
        controller.tabBarItem = UITabBarItem(title: "Journal", image: UIImage(systemName: "pencil.circle"), selectedImage: UIImage(systemName: "pencil.circle.fill"))

        controller.viewModel = JournalViewModel()
        controller.coordinator = self

        navigationController.pushViewController(controller, animated: true)
    }

    
    func toNewJournal() {
        let cordinador = NewJournalMainCoordinator(navigationController: self.navigationController)
        cordinador.start()
    }
    
    func toViewJournal(journal: Journal) {
        let coordinator = ViewJournalCoordinator(journal: journal, navigationController: self.navigationController)
        
        coordinator.start()
    }
}
