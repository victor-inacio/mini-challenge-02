import UIKit

class FeelingViewer: UIImageView {
    
    init(feeling: Feeling) {
        super.init(image: .init(named: feeling.imageName!))
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    init(feeling: String) {
        super.init(image: .init(named: feeling))
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

#Preview("Preview") {
    return FeelingViewer(feeling: "feeling_1")
}
