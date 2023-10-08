import CoreData

extension DifficultyLevel {
    
    static func easy() -> DifficultyLevel {
        
        return getByLabel(label: "Easy")!
        
    }
    
    static func medium() -> DifficultyLevel {
        
        return getByLabel(label: "Medium")!
        
    }
    
    static func hard() -> DifficultyLevel {
        
        return getByLabel(label: "Hard")!
        
    }
    
    static func getAll() throws -> [DifficultyLevel] {
        let dataController = DataController()
        let context = dataController.viewContext
        
        let fetchRequest = fetchRequest()
        
        let results = try context.fetch(fetchRequest)
        
        return results
    }
    
    func isMedium() -> Bool {
        return self.label == "Easy"
    }
    
    func isEasy() -> Bool {
        return self.label == "Medium"
    }
    
    func isHard() -> Bool {
        return self.label == "Hard"
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
