import UIKit

class CellDifficulty: UIView {
    
    private weak var imageView: UIImageView?
    private var labelDificuldade = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup(difficulty: DifficultyLevel){
        self.backgroundColor = .systemBlue
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.labelDificuldade.textAlignment = .center
        self.labelDificuldade.adjustsFontSizeToFitWidth = true
        self.labelDificuldade.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(labelDificuldade)
        self.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1),
            
            labelDificuldade.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            labelDificuldade.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1),
            labelDificuldade.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
        ])
//        
        if difficulty.isEasy() {
            
            imageView.image = UIImage(named: "easy")
            
            self.labelDificuldade.text = "Fácil"
            
        } else if difficulty.isMedium() {
            
            imageView.image = UIImage(named: "medium")
            
            self.labelDificuldade.text = "Médio"
            
            
        } else if difficulty.isHard() {
            imageView.image = UIImage(named: "hard")
            
            self.labelDificuldade.text = "Difícil"
        }
        
        imageView.contentMode = .scaleAspectFit
        
        self.imageView = imageView
        
        self.backgroundColor = UIColor.clear
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


