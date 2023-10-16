import CoreData

extension NSManagedObject {
    
    func delete() throws {
        let dataController = DataController()
        let context = dataController.viewContext
        
        context.delete(self)
        
        try dataController.save()
    }
    
    
}
