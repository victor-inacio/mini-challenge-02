import UIKit

class GoalComponent: UIView {
    
    let title = {
        let label = Label(text: "Meu objetivo:")
        label.font = UIFont(name: "Nunito-Bold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let goal = {
        let textfield = UITextField()
        textfield.text = "Meu Objetivo"
        textfield.font = UIFont(name: "Nunito-Regular", size: 16)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    let icon = {
        let image = UIImageView()
        image.image = UIImage(systemName: "pencil")
        image.contentMode = .scaleAspectFill
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.layer.cornerRadius = 15
        self.backgroundColor = .action
        setupTexts()
    }
    
    private func setupTexts() {
        self.addSubview(title)
        self.addSubview(goal)
        self.addSubview(icon)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor,constant: 6),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 6),
            
            goal.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -6),
            goal.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 6),
            
            icon.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -6),
            icon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6)
        ])
    }
}
