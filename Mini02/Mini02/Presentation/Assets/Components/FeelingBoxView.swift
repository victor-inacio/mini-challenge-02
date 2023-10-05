//
//  FeelingBoxView.swift
//  Mini02
//
//  Created by Guilherme Nunes Lobo on 02/10/23.
//



import UIKit

class FeelingBoxView: UIView {
    
    private let stackView2 = StackView(axis: .horizontal, spacing: 2)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView2()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView2()
    }
    
    private func setupView2() {
        // Configurações da box
        self.backgroundColor = .boxBg
        self.layer.cornerRadius = 30   // Arredonda as bordas da box
        self.clipsToBounds = true
        
        // Configura o stack view vertical para organizar as UIViews internas
        
        
        // Adiciona o stack view à box
        addSubview(stackView2)
        
        // Configura as constraints para o stack view
        NSLayoutConstraint.activate([
            stackView2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            stackView2.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    
    func addImageAndLabel(_ imageName: String, labelText: String, accessibilityHint: String?) {
        // Cria uma UIView interna
        let customView = UIView()
        customView.backgroundColor = .clear // Torna o background da UIView interna invisível
        customView.layer.cornerRadius = 8   // Arredonda as bordas da UIView interna
        customView.clipsToBounds = true
        
        // Cria uma UIImageView para a imagem
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityHint = accessibilityHint // Define apenas a dica de acessibilidade da imagem
        
        // Cria um rótulo para o texto
        let label = UILabel()
        label.text = labelText
        label.textColor = .labelColors
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityHint = accessibilityHint // Define apenas a dica de acessibilidade da label
        
        // Adiciona a imagem e o rótulo à UIView interna
        customView.addSubview(imageView)
        customView.addSubview(label)
        
        // Configura as constraints para a imagem
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 10), // Margem à esquerda da imagem
            imageView.topAnchor.constraint(equalTo: customView.topAnchor, constant: 10), // Margem superior da imagem
            imageView.widthAnchor.constraint(equalToConstant: 30), // Largura da imagem
            imageView.heightAnchor.constraint(equalToConstant: 30), // Altura da imagem
        ])
        
        // Configura as constraints para a label
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 20), // Margem à esquerda da label
            label.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -10), // Margem à direita da label
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5), // Espaço entre a imagem e a label
            label.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -10), // Margem inferior da label
        ])
        
        // Adiciona a UIView interna ao stack view
        stackView2.addArrangedSubview(customView)
    }
    
    
    
    
    

    

}

