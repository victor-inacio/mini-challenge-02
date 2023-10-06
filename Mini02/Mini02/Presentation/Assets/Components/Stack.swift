
import UIKit

class StackView: UIStackView {
    

    init(axis: NSLayoutConstraint.Axis, spacing: CGFloat? = nil, alignment: UIStackView.Alignment = .center ,distribution: UIStackView.Distribution = .equalSpacing) {
        super.init(frame: .init(x: 0, y: 0, width: 100, height: 100))
        translatesAutoresizingMaskIntoConstraints = false
        
        self.axis = axis
        
        if let spacing = spacing {
            self.spacing = spacing
        }
        
        self.distribution = distribution

        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
