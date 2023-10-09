import CoreData

extension Feeling {
    static func getAll() throws -> [Feeling]{
        let dataController = DataController()
        let context = dataController.viewContext
        
        let fetchRequest = fetchRequest()
        
        let result = try context.fetch(fetchRequest)
        
        return result
    }
}
