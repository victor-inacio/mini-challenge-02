import CoreData

extension Journal {
    
    static func create(title: String, text: String, feeling: Feeling) throws {
        
        let dataController = DataController()
        let context = dataController.viewContext
        
        let journal = Journal(context: context)
        
        journal.created_at = .now
        journal.feeling = feeling
        journal.text = text
        journal.title = title
        
        try dataController.save()
        
    }
    
    static func getAll() throws -> [Journal] {
        let fetchRequest = fetchRequest()
        let dataController = DataController()
        let context = dataController.viewContext
        
        let journals = try context.fetch(fetchRequest)

        
        return journals
    }
    
    
}
