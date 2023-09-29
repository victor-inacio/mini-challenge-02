import UIKit

class DiscomfortViewer: UIImageView {
    
    var imageName: String!
    
    init(imageName: String) {
        self.imageName = imageName
        super.init(image: .init(named: imageName))
        
        setup()
    }
    
    private func setup() {
        isAccessibilityElement = true
        
        updateAccessibility()
    }
    
    private func updateAccessibility() {
        accessibilityHint = "Índice de discomforto"
        accessibilityLabel = "Desconforto: \(String(describing: imageName))"
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

#Preview {
    DiscomfortViewer(imageName: "discomfort_1")
}
