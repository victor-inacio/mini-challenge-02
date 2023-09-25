import UIKit
import CoreData

class DataController {
    
    lazy var persistentContainer: NSPersistentContainer = {
        
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
            self.persistentContainer.viewContext
        }
    }
    
    func save(context: NSManagedObjectContext) throws {
        if (context.hasChanges) {
            try context.save()
        }
    }
}
