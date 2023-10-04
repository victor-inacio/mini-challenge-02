import UIKit

class DiscomfortViewer: UIImageView {
    
    var discomfort: DiscomfortLevel!
    
    init(discomfortLevel: DiscomfortLevel) {
        self.discomfort = discomfortLevel
        super.init(image: .init(named: discomfortLevel.imageName!))
        
        setup()
    }
    
    private func setup() {
        isAccessibilityElement = true
        
        updateAccessibility()
    }
    
    private func updateAccessibility() {
        accessibilityHint = "Índice de discomforto"
        accessibilityLabel = "Desconforto: \(String(describing: discomfort.label!))"
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

#Preview {
    let discomfort = DiscomfortLevel()
    
    discomfort.id = UUID()
    discomfort.imageName = "discomfort_1"
    discomfort.label = "discomfort_1"
    
    return DiscomfortViewer(discomfortLevel: discomfort)
}
