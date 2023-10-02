//
//  StatisticsBoxView.swift
//  Mini02
//
//  Created by Guilherme Nunes Lobo on 21/09/23.
//

import UIKit

class StatisticsBoxView: UIView {
    
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        // Configurações da box
        self.backgroundColor = UIColor(red: 0.8, green: 0.855, blue: 0.906, alpha: 1) // Cor de fundo da box
        self.layer.cornerRadius = 41   // Arredonda as bordas da box
        self.clipsToBounds = true
        
        // Configura o stack view vertical para organizar as UIViews internas
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Adiciona o stack view à box
        addSubview(stackView)
        
        // Configura as constraints para o stack view
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    func addStatisticInfo(_ info: String) {
        // Cria uma UIView interna
        let customView = UIView()
        customView.backgroundColor = .clear // Torna o background da UIView interna invisível
        customView.layer.cornerRadius = 8   // Arredonda as bordas da UIView interna
        customView.clipsToBounds = true
        
        // Cria um rótulo para exibir informações
        let infoLabel = UILabel()
        infoLabel.text = info
        infoLabel.textColor = textColorForCurrentMode() // Define a cor do texto com base no modo atual
        infoLabel.textAlignment = .left // Alinhe o texto à esquerda
        
        // Configura o accessibilityLabel com a informação que será lida pelo VoiceOver
        infoLabel.accessibilityLabel = info
        
        // Adiciona o rótulo à UIView interna
        customView.addSubview(infoLabel)
        
        // Configura as constraints para o rótulo (à esquerda)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 10), // Margem à esquerda
            infoLabel.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -10), // Margem à direita
            infoLabel.topAnchor.constraint(equalTo: customView.topAnchor, constant: 10), // Margem superior
            infoLabel.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -10), // Margem inferior
        ])
        
        // Adiciona a UIView interna ao stack view
        stackView.addArrangedSubview(customView)
    }
    
    
    private func textColorForCurrentMode() -> UIColor {
        if traitCollection.userInterfaceStyle == .dark {
            return .white // Modo escuro, cor do texto branca
        } else {
            return .black // Modo claro, cor do texto preta
        }
    }
}
