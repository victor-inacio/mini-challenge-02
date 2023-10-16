import UIKit

protocol JournalListCollectionViewDelegate: AnyObject {
    func onJournalListCollectionViewClick(_ journal: Journal) -> Void
}

class JournalListCollectionView: UICollectionView {
    enum Section{
        case main
    }
    
    weak var delegateB: JournalListCollectionViewDelegate?
    
    var data: [Journal] = [] {
        didSet {
            var snapshot = NSDiffableDataSourceSnapshot<Section, Journal.ID>()
            snapshot.appendSections([.main])
            snapshot.appendItems(self.data.map({ journal in
                journal.id
            }), toSection: .main)
            
            source.apply(snapshot, animatingDifferences: true)
        }
    }
    
    var source: UICollectionViewDiffableDataSource<Section, Journal.ID>!
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .background
        delegate = self
        
        self.register(JournalListCollectionViewCell.self, forCellWithReuseIdentifier: JournalListCollectionViewCell.CellIdentifier)
        
        configDataSource()
        dataSource = source
    }
    
    func configDataSource() {
        source = UICollectionViewDiffableDataSource<Section, Journal.ID>(collectionView: self, cellProvider: { [self] collectionView, indexPath, itemIdentifier in
            
            guard let cell = self.dequeueReusableCell(withReuseIdentifier: JournalListCollectionViewCell.CellIdentifier, for: indexPath) as? JournalListCollectionViewCell else {
                print("There is nothing")
                
                fatalError()
            }
            
            let data = data.first { journal in
                journal.id == itemIdentifier
            }
    
            
            if let data = data {
                cell.config(data: .init(date: data.created_at!, title: data.title!, feeling: data.feeling?.imageName ?? "feeling_1"))
            }
            
            return cell
        })
    }
    
    func applyData(journals: [Journal]) {
        self.data = journals
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder) 
    }
}

extension JournalListCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let journal = data[indexPath.row]
        delegateB?.onJournalListCollectionViewClick(journal)
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
