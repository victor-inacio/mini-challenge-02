// ViewModel da Home
class HomeViewModel: ViewModel {
    
    private var HomeViewController: HomeViewController
    private var coordinator: Coordinator
    
    init(HomeViewController: HomeViewController, coordinator: Coordinator) {
        self.HomeViewController = HomeViewController
        self.coordinator = coordinator
    }
    
    // Método para pegar todas as tasks da Model
    func getTasks() -> [String] {
        
        // getAll() é um método da Model Task
        return [
            "asdsad",
            "asdsad",
            "asdsad",
        ]
    }
}
