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

extension UIColor {
    var dark: UIColor  { resolvedColor(with: .init(userInterfaceStyle: .dark))  }
    var light: UIColor { resolvedColor(with: .init(userInterfaceStyle: .light)) }
    var reversedInterfaceStyle: UIColor {
        get {
            let currentStyle = UIScreen.main.traitCollection.userInterfaceStyle

            return currentStyle == .light ? dark : light
        }
    }
}
