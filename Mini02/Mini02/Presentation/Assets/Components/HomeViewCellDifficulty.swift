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
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.labelDificuldade.textAlignment = .center
        self.labelDificuldade.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(labelDificuldade)
        self.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            
            labelDificuldade.topAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
        
        if difficulty.isEasy() {
            imageView.image = UIImage(named: "easy")
            self.labelDificuldade.text = "Fácil"
        } else if difficulty.isMedium() {
            imageView.image = UIImage(named: "medium")
            self.labelDificuldade.text = "Médio"
        } else if difficulty.isEasy() {
            imageView.image = UIImage(named: "hard")
            self.labelDificuldade.text = "Difícil"
        }
        
        imageView.contentMode = .scaleAspectFill
        
        self.imageView = imageView
        
        self.backgroundColor = UIColor.clear
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


