import UIKit

class JournalList: UIViewController, MVVMCView {
    
    var modelView: JournalViewModel!
    var coordinator: JournalMainCoordinator!
    let header = GoalComponent()
    let addButton = NewJournalButton()
    let journalListTitle = JournalListTitle()
    let collectionView = JournalListCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .background
        self.navigationController?.navigationBar.isHidden = true
        self.hideKeyboardWhenTappedAround()
        setup()
    }
    
    private func setup() {
        header.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(header)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(newJournal), for: .touchUpInside)
        view.addSubview(addButton)
        
        journalListTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(journalListTitle)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            addButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            addButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4),
            
            
            header.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            header.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 25),
            header.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            header.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1),
            
            journalListTitle.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 25),
            journalListTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            collectionView.topAnchor.constraint(equalTo: journalListTitle.bottomAnchor, constant: 25),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    @objc private func newJournal() {
        self.coordinator.toNewJournal()
    }
}
