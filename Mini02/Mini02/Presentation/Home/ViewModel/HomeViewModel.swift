// ViewModel da Home
class HomeViewModel: ViewModel {
    
    // Método para pegar todas as tasks da Model
    func getTasks() -> [String] {
        
        // getAll() é um método da Model Task
        return Task.getAll()
    }
}
