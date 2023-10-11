//
//  NewJournalMainCordinator.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 26/09/23.
//

import UIKit

class NewJournalMainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    func start() {
        let controller = NewJournalViewController()
        controller.viewModel = NewJournalViewModel(viewController: controller)
        navigationController.pushViewController(controller, animated: true)
    }

}
