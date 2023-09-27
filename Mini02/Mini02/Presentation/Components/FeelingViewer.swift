import UIKit

class FeelingViewer: UIImageView {
    
    var feeling: String!
    
    init(feeling: Feeling) {
        self.feeling = feeling.imageName!
        super.init(image: .init(named: self.feeling))
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    init(feeling: String) {
        self.feeling = feeling
        super.init(image: .init(named: self.feeling))
        
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
