import UIKit

class JournalList: UIViewController, MVVMCView {
    
    var modelView: JournalViewModel!
    var coordinator: JournalMainCoordinator!
    let header = GoalComponent()
    let addButton = NewJournalButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "Background")
        
        header.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(header)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)

        NSLayoutConstraint.activate([
            header.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            header.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            header.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            header.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08),
            
            addButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            addButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            addButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4)
        ])
        
    }
}
