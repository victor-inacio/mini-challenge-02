import UIKit

class JournalListTitle: UIView{
    
    private var titulo: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Nunito-Bold", size: 20)
        label.textAlignment = .center
        label.text = "Meu Journal"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var anoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Nunito-Bold", size: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        getAno()
        self.addSubview(titulo)
        self.addSubview(anoLabel)
        
        NSLayoutConstraint.activate([
            titulo.topAnchor.constraint(equalTo: self.topAnchor),
            titulo.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            anoLabel.topAnchor.constraint(equalTo: titulo.bottomAnchor, constant: 6),
            anoLabel.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
    
    private func getAno() {
        let actualDate = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: actualDate)
        self.anoLabel.text = year
    }
}
