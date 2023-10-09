import UIKit

class Button: UIButton {
    
    init(title: String? = nil, font: UIFont?  = .medium) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        configuration = .borderless()
        
        configuration?.titleTextAttributesTransformer = .init({ incoming
            in
            var outgoing = incoming
            outgoing.font = font
            return outgoing
        })
        setTitle(title, for: .normal)
      
        backgroundColor = .action
        
        self.titleLabel?.font = font
        if let title = title {
            setTitle(title, for: .normal)
        }
        
        setTitleColor(.dark, for: .normal)
        
        layer.cornerRadius = 20
        layer.shadowOffset = .init(width: 0, height: 8)
        layer.shadowRadius = 15
        layer.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.1)
        layer.shadowOpacity = 1
    
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

#Preview {
    Button(title: "Testing")
}
