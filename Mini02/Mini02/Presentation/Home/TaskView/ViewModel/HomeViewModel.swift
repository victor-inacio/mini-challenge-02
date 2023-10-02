import Foundation

// ViewModel da Home
class HomeViewModel: ViewModel {
    
    private var homeViewController: HomeViewController
    var coordinator: HomeMainCoordinator!
    var dateToString = DateToString()
    let date = Date()
    var datePickerDate: String?
    
    init(HomeViewController: HomeViewController) {
        self.homeViewController = HomeViewController
    }
    
    func goToCreateTask() {
        self.coordinator.goToCreateNewTask()
    }
    
    func dateString(date: Date) {
        datePickerDate = dateToString.makeDate(date: date)
    }
    
}
