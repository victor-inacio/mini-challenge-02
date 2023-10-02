// ViewModel da Home
class CreateNewTaskViewModel: ViewModel {
    
    private var createNewTaskViewController: CreateNewTaskViewController
    var coordinator: CreateNewTaskCoordinator
    
    init(createNewTaskViewController: CreateNewTaskViewController, coordinator: CreateNewTaskCoordinator) {
        self.createNewTaskViewController = createNewTaskViewController
        self.coordinator = coordinator
    }
}

