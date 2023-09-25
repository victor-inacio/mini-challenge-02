import CoreData
import UIKit

extension Task {
    
    static func getAllUncompleted() -> [Task] {
        let fetchRequest = fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "completed_at = nil")
        
        do {
            let viewContext = (UIApplication.shared.delegate as! AppDelegate).dataController.persistentContainer.viewContext
            
            
            let all = try viewContext.fetch(fetchRequest)
            
            return all
        } catch {
            print(error)
        }
        
        return []
    }
    
    static func getAllCompleted() -> [Task] {
        let fetchRequest = fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "completed_at != nil")
        
        do {
            let viewContext = (UIApplication.shared.delegate as! AppDelegate).dataController.persistentContainer.viewContext
            
            
            let all = try viewContext.fetch(fetchRequest)
            
            return all
        } catch {
            print(error)
        }
        
        return []
    }
    
}
