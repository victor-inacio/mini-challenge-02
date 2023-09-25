import UIKit

class Label: UILabel {
    
    init(text: String) {
        super.init(frame: .init(x: 0, y: 0, width: 100, height: 100))
        translatesAutoresizingMaskIntoConstraints = false
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
