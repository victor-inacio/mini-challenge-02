import UIKit

class Button: UIButton {
    
    override var intrinsicContentSize: CGSize {
        get {
            let baseSize = super.intrinsicContentSize
            return CGSize(width: baseSize.width + 18,//ex: padding 20
                          height: baseSize.height + 12)
        }
    }
    init(title: String) {
        super.init(frame: .init(x: 0, y: 0, width: 100, height: 100))
        
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        backgroundColor = .blue
        
        NSLayoutConstraint.activate([
            
            heightAnchor.constraint(equalToConstant: 48),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
