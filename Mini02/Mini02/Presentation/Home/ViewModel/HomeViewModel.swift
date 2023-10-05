import Foundation

class HomeViewModel: ViewModel {
    
    private var homeViewController: HomeViewController
    var coordinator: HomeMainCoordinator!
    var dateToString = DateToString()
    let date = Date()
    var datePickerDate: String?
    
    init(HomeViewController: HomeViewController) {
        self.homeViewController = HomeViewController
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
    
    func getUncompletedTasks(date: Date) -> [ActiveTask] {
        do {
            let tasks = try ActiveTask.getUncompletedTasksByDate(date: date)
            return tasks
        } catch {
            handle(error: error)
        }
        
        return []
    }
    
    func getCompletedTasks(date: Date) -> [ActiveTask] {
        do {
            let tasks = try ActiveTask.getCompletedTasksByDate(date: date)
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
