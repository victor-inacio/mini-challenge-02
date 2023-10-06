import Foundation



class HomeViewModel: ViewModel {
    
    struct HomeViewData {
        var completedTasks: [ActiveTask]
        var uncompletedTasks: [ActiveTask]
    }
    
    private var homeViewController: HomeViewController
    var coordinator: HomeMainCoordinator!
    var dateToString = DateToString()
    var date: Date = .now
    var datePickerDate: String?
    var data: Observable<HomeViewData> = Observable(.init(completedTasks: [], uncompletedTasks: []))

    var tasks: [Task]?
    
    init(HomeViewController: HomeViewController) {
        self.homeViewController = HomeViewController
        do {
            self.tasks = try Task.getAll()
        } catch {
            print("erro ao carregar")
        }
    }
    
    func goToCreateTask() {
        self.coordinator.goToCreateNewTask()
    }
    
    func dateString(date: Date) {
        datePickerDate = dateToString.makeDate(date: date)
    }
    
    func handle(error: Error) {
        print(error)
    }
    
    func viewDidLoad() {
        print("Model view didLoad: HomeViewModel")
        date = .now
        loadData()
    }
    
    func loadData() {
        let tasks = getTasks(date: .now)
        
        let completedTasks = tasks.filter { task in
            task.completed_at != nil
        }
        
        let uncompletedTasks = tasks.filter { task in
            task.completed_at == nil
        }
        
        data.value = .init(completedTasks: completedTasks, uncompletedTasks: uncompletedTasks)
    }
    
    func didChangeDate(date: Date) {
        self.date = date
        loadData()
    }
    
    func getTasks(date: Date) -> [ActiveTask] {
        do {
            let tasks = try ActiveTask.getTasksByDate(date: date)
            return tasks
        } catch {
            handle(error: error)
        }
        
        return []
    }
    
    func completeTask(task: ActiveTask, date: Date) {
        do {
            try task.complete(date: date)
        } catch {
            handle(error: error)
        }
    }
    
    func uncompleteTask(task: ActiveTask, date: Date) {
        do {
            try task.uncomplete(date: date)
        } catch {
            handle(error: error)
        }
    }
    
}
