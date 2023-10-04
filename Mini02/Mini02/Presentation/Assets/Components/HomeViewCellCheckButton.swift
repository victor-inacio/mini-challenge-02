import UIKit

class CheckBox: UIControl {

    private weak var imageView: UIImageView?
    
    private var image: UIImage {
        if check {
            if let image = UIImage(named: "checkButton"){
                return image
            } else {
                return UIImage(systemName: "checkbox")!
            }
        }else {
            if let image = UIImage(named: "checkButton.fill"){
                return image
            } else {
                return UIImage(systemName: "checkbox.fill")!
            }
        }
    }
    
    public var check: Bool = true {
        didSet{
            imageView?.image = image
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
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.topAnchor.constraint(equalTo: self.topAnchor)
        ])
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        
        self.imageView = imageView
        
        self.backgroundColor = UIColor.clear
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addTarget(self, action: #selector(touchInside), for: .touchUpInside)
    }
    
    @objc private func touchInside(){
        self.check.toggle()
    }
}


