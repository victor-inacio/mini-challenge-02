import CoreData
import UIKit

extension User {

    
    static func getUser(dataController: DataController) throws -> User {
        let fetchRequest = User.fetchRequest()
        let context = dataController.viewContext
        
        let users = try context.fetch(fetchRequest)
        
        print(users.count)
        
        if (users.isEmpty) {
            print("User was empty, creating user")
            let user = User(context: context)
            
            try dataController.save()
            
            return user
        } else {
            print("User not empty")
            return users[0]
        }
    }
    
}

