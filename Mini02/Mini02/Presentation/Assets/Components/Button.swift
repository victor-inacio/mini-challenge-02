import UIKit

class Button: UIButton {
    
    var action: (() -> Void)?
    var colorTitle: UIColor?
    
    init(_ title: String? = nil, font: UIFont?  = .medium, colorTitle: UIColor = .dark, bgColor: UIColor = .action) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        configuration = .borderless()
        
        configuration?.titleTextAttributesTransformer = .init({ incoming
            in
            var outgoing = incoming
            outgoing.font = font
            return outgoing
        })
      
        backgroundColor = bgColor
        
        self.titleLabel?.font = font
        if let title = title {
            setTitle(title, for: .normal)
        }
        
        setCommonProperties()
        
        setTitleColor(colorTitle, for: .normal)
        
        layer.cornerRadius = 20
        layer.shadowOffset = .init(width: 0, height: 8)
        layer.shadowRadius = 15
        layer.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.1)
        layer.shadowOpacity = 1
    
    }
    
    init(title: String? = nil, action: (() -> Void)? = nil, colorTitle: UIColor? = .dark) {
        super.init(frame: .zero)
        
        if let title = title {
            self.setTitle(title, for: .normal)
        }
        
        if let colorTitle = colorTitle {
            setTitleColor(colorTitle, for: .normal)
            
            //Define a cor do botão quando pressionado
            let colorTitleHighlighted = colorTitle.withAlphaComponent(0.8)
            setTitleColor(colorTitleHighlighted, for: .highlighted)
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
