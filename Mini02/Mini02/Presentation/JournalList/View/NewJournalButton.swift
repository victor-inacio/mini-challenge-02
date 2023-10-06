import UIKit

class NewJournalButton: UIControl{
    
    private var text:UILabel = {
        let text = UILabel()
        text.text = "Novo Journal"
        text.textColor = .systemBlue
        text.font = UIFont(name: "Nunito-Regular", size: 24)
        text.adjustsFontSizeToFitWidth = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "plus")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        self.addSubview(image)
        self.addSubview(text)
        
        NSLayoutConstraint.activate([
            text.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            text.heightAnchor.constraint(equalTo: self.heightAnchor),
            text.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            text.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            image.leadingAnchor.constraint(equalTo: self.text.trailingAnchor, constant: 6),
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
