import UIKit

class Button: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        
        configuration = .bordered()
        setTitle(title, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .red
        setTitleColor(.black, for: .highlighted)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
