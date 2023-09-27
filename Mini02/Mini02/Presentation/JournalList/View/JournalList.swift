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

class JournalListCollectionViewCell: UICollectionViewCell {
    
    static var CellIdentifier = "CustomCell"
    let background = UIView()
    let stackView = {
        let stackView = StackView(axis: .horizontal, spacing: 10)
        stackView.backgroundColor = .red
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layer.cornerRadius = 16
        stackView.layoutMargins = .init(top: 0, left: 20, bottom: 0, right: 20)
        return stackView
    }()
    let date = Label(text: "11/11")
    let title = Label(text: "Title")
    let iconImage = UIImageView(image: .init(named: "feeling_1"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        stackView.addArrangedSubview(date)
        
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(iconImage)
        
        
        contentView.addSubview(stackView)
        
        background.backgroundColor = .red
        background.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(background)
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    

    
}

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
            
            print(itemIdentifier)
           
            
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
    JournalList()
}
