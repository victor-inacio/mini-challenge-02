import Foundation

let taskName1 = Label(localizedTextKey: "Cumprimentar alguém com um sorriso") // já foi
let taskName2 = Label(localizedTextKey: "Dar 'bom dia' para alguém na rua") // já foi
let taskName3 = Label(localizedTextKey: "Fazer um elogio a alguém que você conhece")
let taskName4 = Label(localizedTextKey: "Falar sobre clima e outros tópicos triviais com um desconhecido") // já foi
let taskName5 = Label(localizedTextKey: "Olhar nos olhos de alguém enquanto conversa")// já foi
let taskName6 = Label(localizedTextKey: "Perguntar uma informação para alguém") // já foi
let taskName7 = Label(localizedTextKey: "Iniciar uma conversa com alguém que você não conhece bem") // já foi
let taskName8 = Label(localizedTextKey: "Se apresentar ou abordar um grupo de pessoas") // já foi
let taskName9 = Label(localizedTextKey: "Mandar mensagem para alguém de pouca intimidade") // já foi


let taskHint1 = Label(localizedTextKey: "Sorria e diga 'Olá!'") //
let taskHint2 = Label(localizedTextKey: "Diga 'Bom dia!' para um estranho na rua")//
let taskHint3 = Label(localizedTextKey: "Elogie alguém que você já conhece")//
let taskHint4 = Label(localizedTextKey: "Inicie uma conversa sobre tópicos triviais com alguém desconhecido")//
let taskHint5 = Label(localizedTextKey: "Mantenha contato visual durante uma conversa")
let taskHint6 = Label(localizedTextKey: "Peça informações a alguém desconhecido")
let taskHint7 = Label(localizedTextKey: "Faça uma apresentação ou inicie uma conversa com um grupo de pessoas")
let taskHint7 = Label(localizedTextKey: "Envie uma mensagem para alguém que você conhece pouco")





struct TaskSeeder: Seeder {
    func run() throws {
        try addTask(name: "\(taskName1.text ?? "not identified")", hint: "\(taskHint1.text ?? "not identified")", difficultyLevel: DifficultyLevel.easy())
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
        task.name = name
        task.hint = hint
        task.difficultyLevel = difficultyLevel
        
        try dataController.save()
    }
}
