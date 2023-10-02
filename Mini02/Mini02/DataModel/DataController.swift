import UIKit
import CoreData

class DataController {
    
    static var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "DataModel")
        
    
        
        container.loadPersistentStores { descriptor, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        
        return container
        
    }()
    
    
    var viewContext: NSManagedObjectContext {
        get {
            DataController.persistentContainer.viewContext
        }
    }
    
    func save() throws {
        if (viewContext.hasChanges) {
            try viewContext.save()
        }
    }
}
