import UIKit

class JournalList: UIViewController, MVVMCView {
    
    var viewModel: JournalViewModel!
    var coordinator: JournalMainCoordinator!
    let header = GoalComponent()
    let addButton = NewJournalButton()
    let journalListTitle = JournalListTitle()
    let collectionView = JournalListCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .background
        self.navigationController?.navigationBar.isHidden = true
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
            addButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            
            header.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            header.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 25),
            header.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.88),
            header.heightAnchor.constraint(equalTo: self.header.goal.heightAnchor, multiplier: 2.2),
            
            journalListTitle.topAnchor.constraint(equalTo: self.header.bottomAnchor, constant: 25),
            journalListTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            journalListTitle.heightAnchor.constraint(equalTo: self.journalListTitle.titulo.heightAnchor, multiplier: 82.0 / 27.0 ),
            
            collectionView.topAnchor.constraint(equalTo: self.journalListTitle.bottomAnchor, constant: 25),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    @objc private func newJournal() {
        self.coordinator.toNewJournal()
    }
}
