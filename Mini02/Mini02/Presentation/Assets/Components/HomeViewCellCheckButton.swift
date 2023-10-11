import UIKit

class CheckBox: UIControl {

    private var imageView = UIImageView()
    
    private var image: UIImage {
        if !check {
            if let image = UIImage(named: "checkButton"){
                return image
            } else {
                return UIImage(named: "checkbox")!
            }
        }else {
            if let image = UIImage(named: "checkButton.fill"){
                return image
            } else {
                return UIImage(named: "checkbox.fill")!
            }
        }
    }
    
    public var check: Bool = true {
        didSet{
            imageView.image = image
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
        ])
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        
        
        self.backgroundColor = UIColor.clear
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addTarget(self, action: #selector(touchInside), for: .touchUpInside)
    }
    
    @objc private func touchInside(){
        self.check.toggle()
        HapticManager.shared.generateHapticFeedback(style: .soft)
    }
}


