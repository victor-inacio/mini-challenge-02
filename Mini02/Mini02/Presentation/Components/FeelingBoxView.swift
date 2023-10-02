//
//  FeelingBoxView.swift
//  Mini02
//
//  Created by Guilherme Nunes Lobo on 02/10/23.
//



import UIKit

class FeelingBoxView: UIView {
    
    private let stackView2 = StackView(axis: .horizontal, spacing: 5)
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
        self.backgroundColor = UIColor(red: 0.8, green: 0.855, blue: 0.906, alpha: 1) // Cor de fundo da box
        self.layer.cornerRadius = 41   // Arredonda as bordas da box
        self.clipsToBounds = true
        
        // Configura o stack view vertical para organizar as UIViews internas

        
        // Adiciona o stack view à box
        addSubview(stackView2)
        
        // Configura as constraints para o stack view
        NSLayoutConstraint.activate([
            stackView2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView2.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    
    func addImageAndLabel(_ imageName: String, labelText: String) {
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
        
        // Cria um rótulo para o texto
        let label = UILabel()
        label.text = labelText
        label.textColor = textColorForCurrentMode() // Define a cor do texto com base no modo atual
        label.textAlignment = .left // Alinhe o texto à esquerda
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Adiciona a imagem e o rótulo à UIView interna
        customView.addSubview(imageView)
        customView.addSubview(label)
        
        // Configura as constraints para a imagem e o rótulo
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 10), // Margem à esquerda
            imageView.topAnchor.constraint(equalTo: customView.topAnchor, constant: 10), // Margem superior
            imageView.widthAnchor.constraint(equalToConstant: 30), // Largura da imagem
            imageView.heightAnchor.constraint(equalToConstant: 30), // Altura da imagem
            
            label.leadingAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 10), // Espaço entre a imagem e o rótulo
            label.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -10), // Margem à direita
            label.topAnchor.constraint(equalTo: customView.topAnchor, constant: 10), // Margem superior
            label.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -10), // Margem inferior
        ])
        
        // Adiciona a UIView interna ao stack view
        stackView2.addArrangedSubview(customView)
    }
    
    private func textColorForCurrentMode() -> UIColor {
        if traitCollection.userInterfaceStyle == .dark {
            return .white // Modo escuro, cor do texto branca
        } else {
            return .black // Modo claro, cor do texto preta
        }
    }
}
