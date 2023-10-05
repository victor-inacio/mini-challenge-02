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
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            
            labelDificuldade.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            labelDificuldade.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelDificuldade.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
        ])
        
        if difficulty.isEasy() {
            
            imageView.image = UIImage(named: "easy")
          
            
            NSLayoutConstraint.activate([
                imageView.heightAnchor.constraint(equalToConstant: 5),
                imageView.widthAnchor.constraint(equalToConstant: 5)
            ])
            
            self.labelDificuldade.text = "Fácil"
            
        } else if difficulty.isMedium() {
            
            imageView.image = UIImage(named: "medium")
            
            NSLayoutConstraint.activate([
                imageView.heightAnchor.constraint(equalToConstant: 10),
                imageView.widthAnchor.constraint(equalToConstant: 10)
            ])
            
            self.labelDificuldade.text = "Médio"
            
            
        } else if difficulty.isHard() {
            imageView.image = UIImage(named: "hard")
            
            NSLayoutConstraint.activate([
                imageView.heightAnchor.constraint(equalToConstant: 10),
                imageView.widthAnchor.constraint(equalToConstant: 10)
            ])
            
            self.labelDificuldade.text = "Difícil"
        }
        
        imageView.contentMode = .scaleAspectFit
        
        self.imageView = imageView
        
        self.backgroundColor = UIColor.clear
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


