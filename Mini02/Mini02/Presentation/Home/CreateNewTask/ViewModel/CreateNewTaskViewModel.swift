// ViewModel da Home
class CreateNewTaskViewModel: ViewModel {
    
    let selected: Observable<[Task]> = Observable([])
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
    
    func toggleSelect(task: Task) {
        let isSelected = selected.value.contains { _task in
            _task == task
        }
        
        if (isSelected) {
            selected.value = selected.value.filter { _task in
                task != _task
            }
        } else {
            selected.value.append(task)
        }
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

