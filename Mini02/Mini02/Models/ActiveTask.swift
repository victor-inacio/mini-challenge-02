import CoreData

extension ActiveTask {
    
    static func getTasksByDate(date: Date) throws -> [ActiveTask] {
        
        let startOfDay = Calendar.current.startOfDay(for: date)
    
        
        let predicate = NSPredicate(format: "(created_at < %@ && completed_at == nil) || (completed_at >= %@ && completed_at <= %@ && completed_at != nil)", 
            date as NSDate,
            startOfDay as NSDate,
            startOfDay + 86400 as NSDate)
        let dataController = DataController()
        let context = dataController.viewContext
        
        let fetchRequest = fetchRequest()
        fetchRequest.predicate = predicate
        
        let data = try context.fetch(fetchRequest)
        
        return data
    }
    
    
    func isCompleted() -> Bool {
        return completed_at != nil
        
    }
    
    func complete(date: Date) throws {
        let dataController = DataController()
        let context = dataController.viewContext
        
        completed_at = date
        
        try dataController.save()
    }
    
    func uncomplete(date: Date) throws {
        let dataController = DataController()
        let context = dataController.viewContext
        
        completed_at = nil
        
        try dataController.save()
    }
    
    static func activeByTask(task: Task) throws {
        let dataController = DataController()
        let context = dataController.viewContext
        
        let activeTask = ActiveTask(context: context)
        activeTask.task = task
        activeTask.created_at = .now
    
        
        try dataController.save()
    }
    
    
    
}
