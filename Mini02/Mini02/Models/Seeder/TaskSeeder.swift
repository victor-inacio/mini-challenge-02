import Foundation

let taskName1 = Label(localizedTextKey: "Cumprimentar alguém com um sorriso")
let taskName2 = Label(localizedTextKey: "Dar 'bom dia' para alguém na rua")
let taskName3 = Label(localizedTextKey: "Fazer um elogio a alguém que você conhece")
let taskName4 = Label(localizedTextKey: "Falar sobre clima e outros tópicos triviais com um desconhecido")
let taskName5 = Label(localizedTextKey: "Olhar nos olhos de alguém enquanto conversa")
let taskName6 = Label(localizedTextKey: "Perguntar uma informação para alguém")
let taskName7 = Label(localizedTextKey: "Iniciar uma conversa com alguém que você não conhece bem")
let taskName8 = Label(localizedTextKey: "Se apresentar ou abordar um grupo de pessoas")
let taskName9 = Label(localizedTextKey: "Mandar mensagem para alguém de pouca intimidade")


let taskHint1 = Label(localizedTextKey: "Sorria e diga 'Olá!'")
let taskHint2 = Label(localizedTextKey: "Diga 'Bom dia!' para um estranho na rua")
let taskHint3 = Label(localizedTextKey: "Elogie alguém que você já conhece")
let taskHint4 = Label(localizedTextKey: "Inicie uma conversa sobre tópicos triviais com alguém desconhecido")
let taskHint5 = Label(localizedTextKey: "Mantenha contato visual durante uma conversa")
let taskHint6 = Label(localizedTextKey: "Peça informações a alguém desconhecido")
let taskHint7 = Label(localizedTextKey: "Faça uma apresentação ou inicie uma conversa com um grupo de pessoas")
let taskHint8 = Label(localizedTextKey: "Envie uma mensagem para alguém que você conhece pouco")





struct TaskSeeder: Seeder {
    func run() throws {
        try addTask(name: "\(taskName1.text ?? "not identified")", hint: "\(taskHint1.text ?? "not identified")", difficultyLevel: DifficultyLevel.easy())
       try addTask(name: "\(taskName2.text ?? "not identified")", hint: "\(taskHint2.text ?? "not identified")", difficultyLevel: DifficultyLevel.easy())
       try addTask(name: "\(taskName3.text ?? "not identified")", hint: "\(taskHint3.text ?? "not identified")", difficultyLevel: DifficultyLevel.easy())
    
       try addTask(name: "\(taskName4.text ?? "not identified")", hint: "\(taskHint4.text ?? "not identified")", difficultyLevel: DifficultyLevel.medium())
       try addTask(name: "\(taskName5.text ?? "not identified")", hint: "\(taskHint5.text ?? "not identified")", difficultyLevel: DifficultyLevel.medium())
       try addTask(name: "\(taskName6.text ?? "not identified")", hint: "\(taskHint6.text ?? "not identified")", difficultyLevel: DifficultyLevel.medium())
       
       try addTask(name: "\(taskName7.text ?? "not identified")", hint: "\(taskHint7.text ?? "not identified")", difficultyLevel: DifficultyLevel.hard())
       try addTask(name: "\(taskName8.text ?? "not identified")", hint: "\(taskHint8.text ?? "not identified")", difficultyLevel: DifficultyLevel.hard())
       try addTask(name: "\(taskName9.text ?? "not identified")", hint: "\(taskHint8.text ?? "not identified")", difficultyLevel: DifficultyLevel.hard())
    }
    
    private func addTask(name: String, hint: String, difficultyLevel: DifficultyLevel) throws {
        let dataController = DataController()
        let context = dataController.viewContext
        
        let task = Task(context: context)
        task.name = name
        task.hint = hint
        task.difficultyLevel = difficultyLevel
        
        try dataController.save()
    }
}
