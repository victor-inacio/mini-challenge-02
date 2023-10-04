import UIKit

struct FeelingViewerData {
    let label: String
    let imageName: String
}

class FeelingViewer: UIImageView {
    
    var imageName: String!
    var label: String!
    
    init(feeling: Feeling) {
        self.label = feeling.label!
        self.imageName = feeling.imageName!
        super.init(image: .init(named: self.imageName))
        
        setup()
    }
    
    init(data: FeelingViewerData) {
        self.label = data.label
        self.imageName = data.imageName
        super.init(image: .init(named: self.imageName))
        
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        self.isUserInteractionEnabled = true
        
        isAccessibilityElement = true
        accessibilityHint = "Feeling of journal page"
        accessibilityLabel = label
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

#Preview("Preview") {
    return FeelingViewer(data: .init(label: "Hungry", imageName: "feeling_5"))
}
