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
        controller.modelView = JournalViewModel()
        navigationController.pushViewController(controller, animated: true)
    }
}
