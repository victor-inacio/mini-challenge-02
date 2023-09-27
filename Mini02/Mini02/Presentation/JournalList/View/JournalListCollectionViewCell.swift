import UIKit

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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stackView.addArrangedSubview(date)
        
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(FeelingViewer(feeling: "feeling_1"))
        
        
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

#Preview {
    
    JournalListCollectionViewCell()
}
