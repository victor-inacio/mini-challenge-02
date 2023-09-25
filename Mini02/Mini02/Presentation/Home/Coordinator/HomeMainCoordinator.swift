import UIKit

class HomeMainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // O coordinator faz a HomeViewController aparecer na tela
    func start() {
        let controller = HomeViewController()
        // Ele diz qual é a model view da HomeViewController
        controller.modelView = HomeViewModel()
        
        // Faz a HomeViewController aparecer na tela
        navigationController.pushViewController(controller, animated: true)
    }
}
