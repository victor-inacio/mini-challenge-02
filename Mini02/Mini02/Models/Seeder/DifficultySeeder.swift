import Foundation
struct DifficultySeeder: Seeder {
    func run() throws {
        let difficulties = [
            "Iniciante",
            "Intermediário",
            "Difícil",
        ]
        
        let dataController = DataController()
        let context = dataController.viewContext
        
        for difficulty in difficulties {
            let difficultyLevel = DifficultyLevel(context: context)
            
            difficultyLevel.id = UUID()
            difficultyLevel.label = difficulty
            
            try dataController.save()
        }
    }
}
