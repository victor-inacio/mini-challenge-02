import UIKit

class JournalList: UIViewController, MVVMCView {
    var modelView: JournalViewModel!
    
    let collectionView = JournalListCollectionView()
    let button = {
        let button = Button(title: "Add")
        return button
    }()
    
    let stackView = StackView(axis: .vertical, spacing: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
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
