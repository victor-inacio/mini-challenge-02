import Foundation



struct FeelingSeeder: Seeder {
    func run() throws {
        
        let feelingRange = 1...5
        
        let dataController = DataController()
        let context = dataController.viewContext
        
        for index in feelingRange {
            let feeling = Feeling(context: context)
            
            feeling.imageName = "feeling_\(index)"
            
            try dataController.save()
        }
        
        
    }
}
