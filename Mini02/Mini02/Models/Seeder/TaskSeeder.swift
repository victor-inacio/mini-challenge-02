import Foundation

struct TaskSeeder: Seeder {
    func run() throws {
        try addTask(name: "Cumprimentar alguém com um sorriso", hint: "Sorria e diga 'Olá!'", difficultyLevel: DifficultyLevel.easy())
       try addTask(name: "Dar 'bom dia' para alguém na rua", hint: "Diga 'Bom dia!' para um estranho na rua", difficultyLevel: DifficultyLevel.easy())
       try addTask(name: "Fazer um elogio a alguém que você conhece", hint: "Elogie alguém que você já conhece", difficultyLevel: DifficultyLevel.easy())
    
       try addTask(name: "Falar sobre clima e outros tópicos triviais com um desconhecido", hint: "Inicie uma conversa sobre tópicos triviais com alguém desconhecido", difficultyLevel: DifficultyLevel.medium())
       try addTask(name: "Olhar nos olhos de alguém enquanto conversa", hint: "Mantenha contato visual durante uma conversa", difficultyLevel: DifficultyLevel.medium())
       try addTask(name: "Perguntar uma informação para alguém", hint: "Peça informações a alguém desconhecido", difficultyLevel: DifficultyLevel.medium())
       
       try addTask(name: "Iniciar uma conversa com alguém que você não conhece bem", hint: "Tente iniciar uma conversa com alguém desconhecido", difficultyLevel: DifficultyLevel.hard())
       try addTask(name: "Se apresentar ou abordar um grupo de pessoas", hint: "Faça uma apresentação ou inicie uma conversa com um grupo de pessoas", difficultyLevel: DifficultyLevel.hard())
       try addTask(name: "Mandar mensagem para alguém de pouca intimidade", hint: "Envie uma mensagem para alguém que você conhece pouco", difficultyLevel: DifficultyLevel.hard())
    }
    
    private func addTask(name: String, hint: String, difficultyLevel: DifficultyLevel) throws {
        let dataController = DataController()
        let context = dataController.viewContext
        
        let task = Task(context: context)
        task.id = UUID()
        task.name = name
        task.hint = hint
        task.difficultyLevel = difficultyLevel
        
        try dataController.save()
    }
}
