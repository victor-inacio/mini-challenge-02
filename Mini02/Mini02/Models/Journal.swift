import CoreData

extension Journal {
    
    static func getAll() throws -> [Journal] {
        let fetchRequest = fetchRequest()
        let dataController = DataController()
        let context = dataController.viewContext
        
        let journals = try context.fetch(fetchRequest)

        
        return journals
    }
    
    
}
