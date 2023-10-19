import UIKit

class JournalMainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    let titletab2 = Label(localizedTextKey: "Diário")

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let controller = JournalList()
        controller.tabBarItem = UITabBarItem(title: "\(titletab2.text  ?? "not identified")", image: UIImage(systemName: "pencil.circle"), selectedImage: UIImage(systemName: "pencil.circle.fill"))

        controller.viewModel = JournalViewModel()
        controller.coordinator = self

        navigationController.pushViewController(controller, animated: true)
    }

    
    func toNewJournal() {
        let cordinador = NewJournalMainCoordinator(navigationController: self.navigationController)
        cordinador.start()
    }
}
