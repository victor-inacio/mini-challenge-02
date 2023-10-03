import UIKit

class JournalList: UIViewController, MVVMCView {
    var modelView: JournalViewModel!
    
    var coordinator: JournalMainCoordinator!
    
    let collectionView = JournalListCollectionView()
    
    let header = JournalListHeader()
    
    let stackView = StackView(axis: .vertical, spacing: 10)
    
    @objc let btnNewJournal = Button(title: "+")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(header)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: 170),
            
            collectionView.topAnchor.constraint(equalTo: header.lastView.bottomAnchor, constant: 25),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        view.addSubview(btnNewJournal)
        
        btnNewJournal.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            btnNewJournal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnNewJournal.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btnNewJournal.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            btnNewJournal.leadingAnchor.constraint(equalTo: view.leadingAnchor),

        ])
                
        btnNewJournal.addTarget(self, action: #selector( btnNewJournalTap), for: .touchUpInside)
        
        
    }
    
    @objc func onTap() {
        collectionView.addToDataSource()
    }
    
    @objc func btnNewJournalTap() {
        print("Foi clicado")
        
        
        
        let cordinator = JournalMainCoordinator( navigationController: self.coordinator.navigationController)
        
        cordinator.toNewJournal()
    }
}

#Preview {
    JournalList()
}
