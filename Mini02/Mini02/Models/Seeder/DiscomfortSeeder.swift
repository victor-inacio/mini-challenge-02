import Foundation



struct DiscomfortSeeder: Seeder {
    func run() throws {
        
        let discomfortRange = 1...4
        
        let dataController = DataController()
        let context = dataController.viewContext
        
        for index in discomfortRange {
            let difficultyLevel = DiscomfortLevel(context: context)
            
            difficultyLevel.id = UUID()
            difficultyLevel.label = "discomfort_\(index)"
            difficultyLevel.imageName = "discomfort_\(index)"
            
            try dataController.save()
        }
        
        
    }
}
