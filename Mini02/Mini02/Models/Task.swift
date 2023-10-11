import CoreData



extension Task {

    
    static func getAll() throws -> [Task] {
        let dataController = DataController()
        let context = dataController.viewContext
        
        let fetchRequest = fetchRequest()
        
        let result = try context.fetch(fetchRequest)
        
        return result
    }
    
    static func addTask(name: String, description: String, difficultyLevel: DifficultyLevel) throws -> Task {
        
        let dataController = DataController()
        let context = dataController.viewContext
        
        let task = Task(context: context)
        task.name = name
        task.hint = description
        task.difficultyLevel = difficultyLevel
        
        try dataController.save()
        
        return task
        
    }
    
    func active() throws {
        try ActiveTask.activeByTask(task: self)
    }
    
}
