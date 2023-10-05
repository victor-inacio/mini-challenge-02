import CoreData

extension ActiveTask {
    
    static func getTasksByDate(date: Date) throws -> [ActiveTask] {
        
        let predicate = NSPredicate(format: "(created_at <= %@ && completed_at == nil) || (completed_at == %@)", date as NSDate)
        
        let dataController = DataController()
        let context = dataController.viewContext
        
        let fetchRequest = fetchRequest()
        fetchRequest.predicate = predicate
        
        let data = try context.fetch(fetchRequest)
        
        return data
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
    
}
