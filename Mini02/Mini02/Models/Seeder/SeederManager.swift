import Foundation

struct SeederManager {
    
    func start() {
        
        do {
            try runAll()
        } catch {
            fatalError("Something went wrong when seeding: \(error)")
        }
        
        print("Sucessfull seeding")
    }
    
    private func runAll() throws {
        try DifficultySeeder().run()
    }
}
