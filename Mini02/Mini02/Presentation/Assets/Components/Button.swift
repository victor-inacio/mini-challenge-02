import UIKit

class Button: UIButton {
    
    init(title: String? = nil) {
        super.init(frame: .zero)
        
        configuration = .borderless()
        setTitle(title, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .action
        
        if let title = title {
            setTitle(title, for: .normal)
        }
        
        setTitleColor(.dark, for: .normal)
        titleLabel?.font = .medium
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
