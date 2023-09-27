import Foundation

// ViewModel da Home
class HomeViewModel: ViewModel {
    
    private var homeViewController: HomeViewController
    var coordinator: HomeMainCoordinator!
    
    init(HomeViewController: HomeViewController) {
        self.homeViewController = HomeViewController
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
    
    func goToCreateTask() {
        self.coordinator.goToCreateNewTask()
    }
}
