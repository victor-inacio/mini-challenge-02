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
    
    private func isSelected(task: Task) -> Bool {
        return selected.value.contains { _task in
            _task == task
        }
    }
    
    private func select(task: Task) {
        selected.value.append(task)
    }
    
    func activateTask(task: Task) {
        guard !isSelected(task: task) else {
            return
        }
        
        do {
            try task.active()
            select(task: task)
        } catch {
            self.error.value = error.localizedDescription
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

