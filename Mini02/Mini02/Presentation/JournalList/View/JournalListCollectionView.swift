import UIKit

class JournalListCollectionView: UICollectionView {
    
    
    enum Section{
        case main
    }
    
    var texts = Array(1...10)

    var source: UICollectionViewDiffableDataSource<Section, Int>!
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        
        delegate = self
        self.backgroundColor = .background
        configDataSource()
        dataSource = source
        self.register(JournalListCollectionViewCell.self, forCellWithReuseIdentifier: JournalListCollectionViewCell.CellIdentifier)
        

    }
    
    func configDataSource() {
        source = UICollectionViewDiffableDataSource<Section, Int>(collectionView: self, cellProvider: { [self] collectionView, indexPath, itemIdentifier in
            
            guard let cell = self.dequeueReusableCell(withReuseIdentifier: JournalListCollectionViewCell.CellIdentifier, for: indexPath) as? JournalListCollectionViewCell else {
                print("There is nothing")
                
                fatalError()
            }
            
            cell.config(data: .init(date: .now, title: "Teste", feeling: "feeling_1"))
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOpacity = 0.2
            cell.layer.shadowOffset = CGSize(width: 0, height: 8)
            cell.layer.shadowRadius = 10
            
            
            return cell
        })
        
        var initialSnapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        initialSnapshot.appendSections([.main])
        initialSnapshot.appendItems(Array(1...5), toSection: .main)
        
        source.apply(initialSnapshot)
    }
    
    @objc func addToDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0...5), toSection: .main)
        
        source.apply(snapshot, animatingDifferences: true)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension JournalListCollectionView: UICollectionViewDelegate {
    
    override func numberOfItems(inSection section: Int) -> Int {
        return self.texts.count
    }
    

}

extension JournalListCollectionView: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = frame.width * 0.9
        let height = frame.height * 0.15
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
}

#Preview {
    JournalListCollectionView()
}
