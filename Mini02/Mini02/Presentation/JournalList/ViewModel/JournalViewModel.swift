class JournalViewModel: ViewModel {
    
    let data: Observable<[Journal]> = Observable([])
    let error: Observable<String?> = Observable(nil)
    
    
    func viewDidLoad() {
        fetchData()
    }
    
    func handleError(_ error: Error) {
        self.error.value = error.localizedDescription
    }
    
    func fetchData() {
        
        do {
            let journals = try Journal.getAll()
            self.data.value = journals
        } catch {
            handleError(error)
        }
        
        
        
    }

}
