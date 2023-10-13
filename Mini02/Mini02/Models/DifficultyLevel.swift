import CoreData

extension DifficultyLevel {
    
    func getTasks() -> Set<Task> {
        return self.tasks as! Set<Task>
    }
    
    static func easy() -> DifficultyLevel {
        
        return getByLabel(label: "Iniciante")!
        
    }
    
    static func medium() -> DifficultyLevel {
        
        return getByLabel(label: "Intermediário")!
        
    }
    
    static func hard() -> DifficultyLevel {
        
        return getByLabel(label: "Avançado")!
        
    }
    
    static func getAll() throws -> [DifficultyLevel] {
        let dataController = DataController()
        let context = dataController.viewContext
        
        let fetchRequest = fetchRequest()
        
        let results = try context.fetch(fetchRequest)
        
        return results
    }
    
    func isMedium() -> Bool {
        return self.label == "Iniciante"
    }
    
    func isEasy() -> Bool {
        return self.label == "Intermediário"
    }
    
    func isHard() -> Bool {
        return self.label == "Avançado"
    }
    
    static func getByLabel(label: String) -> DifficultyLevel? {
        
        let dataController = DataController()
        let context = dataController.viewContext
        
        let fetchRequest = fetchRequest()
        let predicate = NSPredicate(format: "label = %@", label)
        
        fetchRequest.predicate = predicate
        
        do {
            let result = try context.fetch(fetchRequest)
            
            return result[0]
        } catch {
            
        }
        
        return nil
    }
}
