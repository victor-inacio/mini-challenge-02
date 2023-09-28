import UIKit

class JournalList: UIViewController, MVVMCView {
    var modelView: JournalViewModel!
    
    let collectionView = JournalListCollectionView()
    
    let header = JournalListHeader()
    
    let stackView = StackView(axis: .vertical, spacing: 10)
    
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
    }
    
    @objc func onTap() {
        collectionView.addToDataSource()
    }
    
}

#Preview {
    JournalList()
}
