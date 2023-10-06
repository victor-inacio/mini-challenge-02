import UIKit

class JournalListHeader: UIView {
    
    let goalComponent = GoalComponent()
    let background = {
            let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemYellow
        
        return view
    }()

    
    let year = {
        let label = Label(text: "2023")
        label.isAccessibilityElement = true
        label.accessibilityHint = "Ano atual"
        label.accessibilityHint = "Ano atual: \(label.text!)"
        return label
    }()
    
    var lastView: UIView!
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(background)
        addSubview(goalComponent)
        addSubview(year)
        
        lastView = year
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: topAnchor),
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            goalComponent.centerYAnchor.constraint(equalTo: background.bottomAnchor),
            goalComponent.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            
            year.topAnchor.constraint(equalTo: goalComponent.bottomAnchor, constant: 10),
            year.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
