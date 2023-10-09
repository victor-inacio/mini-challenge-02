// ViewModel da Home
class CreateNewTaskViewModel: ViewModel {
    
    var createNewTaskViewController: CreateNewTaskViewController
    var coordinator: CreateNewTaskCoordinator!
    
    init(createNewTaskViewController: CreateNewTaskViewController) {
        self.createNewTaskViewController = createNewTaskViewController
    }
}

