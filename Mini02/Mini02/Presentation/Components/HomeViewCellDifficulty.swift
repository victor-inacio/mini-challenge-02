import UIKit

class CellDifficulty: UIControl {

    private weak var imageView: UIImageView?
    
    private var image: UIImage {
        return difficulty ? UIImage(systemName: "checkmark.square.fill")! : UIImage(systemName: "square")!
    }
    
    public var difficulty: Bool = false {
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
        
//        self.addTarget(self, action: #selector(touchInside), for: .touchUpInside)
    }
    
//    @objc private func touchInside(){
//        self.check.toggle()
//        print(self.check)
//    }
}


