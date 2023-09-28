import UIKit

class StackView: UIStackView {
    
    init(axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0, alignment: UIStackView.Alignment = .center ,distribution: UIStackView.Distribution = .equalSpacing) {
        super.init(frame: .init(x: 0, y: 0, width: 100, height: 100))
        translatesAutoresizingMaskIntoConstraints = false
        
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.alignment = alignment
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
