import UIKit

class JournalList: UIViewController, MVVMCView {
    
    var viewModel: JournalViewModel!
    var coordinator: JournalMainCoordinator!
    let header = GoalComponent()
    let addButton = UIButton()
    let journalListTitle = JournalListTitle()
    let collectionView = JournalListCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .background
        self.navigationController?.navigationBar.isHidden = true
        setup()
            
        bind()
         
        viewModel.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.viewDidLoad()
    }
    
    private func bind() {
        viewModel.data.observe(on: self) { journals in
            self.collectionView.applyData(journals: journals)
        }
        
        viewModel.error.observe(on: self) { error in
            self.showError() 
        }
    }
    
    private func showError() {
        let title = "Error"
        let message = viewModel.error.value
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Fechar", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    private func setup() {
        header.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(header)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("NovoJournal +", for: .normal)
        addButton.titleLabel?.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "Nunito-bold", size: 20)!)
        addButton.setTitleColor(.systemBlue, for: .normal)
        addButton.addTarget(self, action: #selector(newJournal), for: .touchUpInside)
        view.addSubview(addButton)

        journalListTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(journalListTitle)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegateB = self
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

extension JournalList: JournalListCollectionViewDelegate {
    
    func onJournalListCollectionViewClick(_ journal: Journal) {
        coordinator.toViewJournal(journal: journal)
    }
}
