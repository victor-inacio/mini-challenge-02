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
        
        self.isAccessibilityElement = true
        self.accessibilityLabel = "Novo Journal"
        self.accessibilityHint = "Botão para criar Novo Journal"
        
        self.addSubview(image)
        self.addSubview(text)
        
        NSLayoutConstraint.activate([
            text.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            text.heightAnchor.constraint(equalTo: self.heightAnchor),
            text.trailingAnchor.constraint(equalTo: self.image.leadingAnchor),
        
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            image.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6),
            image.trailingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}
