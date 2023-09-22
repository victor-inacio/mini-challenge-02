import CoreData

class TaskViewModel {
    
    func getAllUnCompleted() -> [Task] {
        return Task.getAllUncompleted()
    }
    
    func getAllCompleted() -> [Task] {
        return Task.getAllCompleted()
    }
    
}
