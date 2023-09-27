import UIKit

struct JournalListCollectionViewCellData {
    let date: Date
    let title: String
    let feeling: String
}

class JournalListCollectionViewCell: UICollectionViewCell {
    
    static var CellIdentifier = "CustomCell"

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
    let feeling = FeelingViewer(feeling: "feeling_1")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stackView.addArrangedSubview(date)
        
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(feeling)
        
        contentView.addSubview(stackView)
        
        
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
    
    func config(data: JournalListCollectionViewCellData) {
        
        date.text = getFormattedDate(date: data.date)
        title.text = data.title
        feeling.feeling = data.feeling
        
    }

    func getFormattedDate(date: Date, format: String = "dd/mm") -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
}

#Preview {
    
    let component = JournalListCollectionViewCell()
    
    component.config(data: .init(date: .now, title: "Title Test", feeling: "feeling_2"))
    
    return component
}
