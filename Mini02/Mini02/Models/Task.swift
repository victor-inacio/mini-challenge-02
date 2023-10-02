import CoreData



extension Task {
    static func getAll() throws -> [Task] {
        let dataController = DataController()
        let context = dataController.viewContext
        
        let fetchRequest = fetchRequest()
        
        let result = try context.fetch(fetchRequest)
        
        return result
    }
}
