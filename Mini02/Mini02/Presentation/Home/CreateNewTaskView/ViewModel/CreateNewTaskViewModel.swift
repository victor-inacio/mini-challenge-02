// ViewModel da Home
class CreateNewTaskViewModel: ViewModel {
    
    private var createNewTaskViewController: CreateNewTaskViewController
    private var coordinator: Coordinator
    
    init(createNewTaskViewController: CreateNewTaskViewController, coordinator: Coordinator) {
        self.createNewTaskViewController = createNewTaskViewController
        self.coordinator = coordinator
    }
}

