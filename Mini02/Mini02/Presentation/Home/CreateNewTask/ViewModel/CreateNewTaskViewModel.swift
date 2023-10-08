// ViewModel da Home
class CreateNewTaskViewModel: ViewModel {
    
    let data: Observable<[DifficultyLevel]> = Observable([])
    let error: Observable<String?> = Observable(nil)
    
    var createNewTaskViewController: CreateNewTaskViewController
    var coordinator: CreateNewTaskCoordinator!
    
    init(createNewTaskViewController: CreateNewTaskViewController) {
        self.createNewTaskViewController = createNewTaskViewController
    }
    
    func viewDidLoad() {
        fetchDifficulties()
    }
    
    private func fetchDifficulties() {
        do {
            let data = try DifficultyLevel.getAll()
            
            self.data.value = data
        } catch {
            self.error.value = error.localizedDescription
        }
    }
    
}

