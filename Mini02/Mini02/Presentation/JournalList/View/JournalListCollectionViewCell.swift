import UIKit

struct JournalListCollectionViewCellData {
    let date: Date
    let title: String
    let feeling: String
}

class JournalListCollectionViewCell: UICollectionViewCell {
    
    static var CellIdentifier = "JournalListCell"

    let stackView = {
        let stackView = StackView(axis: .horizontal, spacing: 10)
        stackView.backgroundColor = .systemBackground
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layer.cornerRadius = 16
        stackView.spacing = 16
        stackView.layoutMargins = .init(top: 0, left: 20, bottom: 0, right: 20)
        return stackView
    }()
    
    let date = Label(localizedTextKey: "11/11")
    let title = {
        let label = Label(localizedTextKey: "Title")
            
        label.numberOfLines = 0
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        label.sizeToFit()
        return label
    }()
    
    let titleContainer = {
        let titleContainer = UIView()
        titleContainer.translatesAutoresizingMaskIntoConstraints = false
        return titleContainer
    }()
    
    let feeling = FeelingViewer(feeling: "feeling_1")
    
    let divisor:UIView = {
        let view = UIView()
        view.backgroundColor = .boxText
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stackView.addArrangedSubview(date)
        
        stackView.addArrangedSubview(divisor)

        titleContainer.addSubview(title)
        stackView.addArrangedSubview(titleContainer)
        stackView.addArrangedSubview(feeling)
        
        contentView.addSubview(stackView)
        
        isAccessibilityElement = true
        accessibilityHint = "Um dos journals"

        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            date.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            
            divisor.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.4),
            divisor.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            divisor.widthAnchor.constraint(equalToConstant: 2),
            divisor.leadingAnchor.constraint(equalTo: date.trailingAnchor, constant: 16),
                        
            title.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: titleContainer.trailingAnchor),
            title.centerYAnchor.constraint(equalTo: titleContainer.centerYAnchor),
            title.topAnchor.constraint(equalTo: titleContainer.topAnchor),
            title.bottomAnchor.constraint(equalTo: titleContainer.bottomAnchor),
            
            feeling.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateAccesibility() {
        print(date.text)
        accessibilityLabel = "Journal do dia \(date.text), titulo: \(title.text), sentimento do dia: \(feeling.feeling)"
    }
    
    func config(data: JournalListCollectionViewCellData) {
        
        date.text = getFormattedDate(date: data.date)
        title.text = data.title
        title.sizeToFit()
        feeling.feeling = data.feeling
        
        updateAccesibility()
    }

    func getFormattedDate(date: Date, format: String = "dd/mm") -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
}

#Preview {
    let component = JournalListCollectionViewCell()
    
    component.config(data: .init(date: .now, title: "Title tesa segerg ehge gerg  wrf erg eg erge refe rrgfer g eg er egegegerggg ergergggrewefewfwef wef wf wef wef w ff rg ", feeling: "feeling_2"))
    
    return component
}
