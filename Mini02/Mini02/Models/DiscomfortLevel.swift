import CoreData

extension DiscomfortLevel {
    
    static func getAll() throws -> [DiscomfortLevel] {
        let fetchRequest = fetchRequest()
        let context = DataController().viewContext
        
        let levels = try context.fetch(fetchRequest)
        
       return levels
    }
    
}
