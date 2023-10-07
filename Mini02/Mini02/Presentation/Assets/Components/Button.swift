import UIKit

class Button: UIButton {
    
    var action: (() -> Void)?
    
    init(title: String? = nil) {
        super.init(frame: .zero)
        
        configuration = .borderless()
        backgroundColor = .action
        
        if let title = title {
            setTitle(title, for: .normal)
        }
        
        setCommonProperties()
        
        setTitleColor(.dark, for: .normal)
        titleLabel?.font = .medium
        layer.cornerRadius = 20
        layer.shadowOffset = .init(width: 0, height: 8)
        layer.shadowRadius = 15
        layer.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.1)
        layer.shadowOpacity = 1
    }
    
    init(title: String? = nil, action: (() -> Void)? = nil) {
        super.init(frame: .zero)
        
        if let title = title {
            self.setTitle(title, for: .normal)
        }
        
        setCommonProperties()
        
        self.action = action
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setCommonProperties() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func buttonTapped() {
        if let action = action {
            action()
        } else {
            print("The button action is nil")
        }
    }

    
}

#Preview {
    Button(title: "Testing")
}
