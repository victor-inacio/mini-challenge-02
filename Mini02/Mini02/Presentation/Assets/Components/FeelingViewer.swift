import UIKit

class FeelingViewer: UIImageView {
    
    var feeling: String!
    
    init(feeling: Feeling) {
        self.feeling = feeling.imageName!
        super.init(image: .init(named: self.feeling))
        setup()
    }
    
    init(feeling: String) {
        self.feeling = feeling
        super.init(image: .init(named: self.feeling))
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

#Preview("Preview") {
    return FeelingViewer(feeling: "feeling_5")
}
