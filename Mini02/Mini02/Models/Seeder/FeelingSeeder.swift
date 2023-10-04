import Foundation



struct FeelingSeeder: Seeder {
    func run() throws {
        
        let feelingRange = 1...5
        
        let dataController = DataController()
        let context = dataController.viewContext
        
        let labels = [
            "Happy",
            "In Love",
            "Oh Yeah",
            "Sad",
            "Angry",
        ]
        
        for (index, label) in labels.enumerated() {
            let feeling = Feeling(context: context)
            
            feeling.id = UUID()
            feeling.imageName = "feeling_\(index)"
            feeling.label = label
            
            try dataController.save()
        }
    }
}
