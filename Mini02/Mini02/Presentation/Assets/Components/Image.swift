import UIKit

class Image: UIImageView {
    
    init(named: String) {
        super.init(image: .init(named: named))
    }
    
    init(systemName: String) {
        super.init(image: .init(systemName: systemName))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
