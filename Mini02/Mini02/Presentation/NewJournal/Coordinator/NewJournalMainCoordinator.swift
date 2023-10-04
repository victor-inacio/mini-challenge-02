//
//  NewJournalMainCordinator.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 26/09/23.
//

import Foundation
import UIKit

class NewJournalMainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var natigationController: UINavigationController
    
    init(natigationController: UINavigationController) {
        self.natigationController = natigationController
    }
    
    func start() {
        let controller = NewJournalViewController()
    }

}
