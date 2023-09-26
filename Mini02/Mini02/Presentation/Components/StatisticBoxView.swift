//
//  StatisticsBoxView.swift
//  Mini02
//
//  Created by Guilherme Nunes Lobo on 21/09/23.
//

import UIKit


class StatisticsBoxView: UIView {
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
        self.backgroundColor = UIColor(named: "box_bg") // Cor de fundo da box
        self.layer.cornerRadius = 15   // Arredonda as bordas da box
        self.clipsToBounds = true
        
        // Cria um stack view vertical para organizar as UIViews internas
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Cria e adiciona as UIViews internas à box
        for _ in 1...3 {
            let customView = UIView()
            customView.backgroundColor = .clear // Torna o background da UIView interna invisível
            customView.layer.cornerRadius = 8   // Arredonda as bordas da UIView interna
            customView.clipsToBounds = true
            
            // Cria um rótulo para exibir informações
            let infoLabel = UILabel()
            infoLabel.text = "Informação da estatística"
            infoLabel.textAlignment = .left // Alinhe o texto à esquerda
            
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
            
            // Configura as constraints para as UIViews internas
            NSLayoutConstraint.activate([
                customView.heightAnchor.constraint(equalToConstant: 40), // Altura fixa das views internas
            ])
        }
        
        // Adiciona o stack view à box
        self.addSubview(stackView)
        
        // Configura as constraints para o stack view
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
        ])
    }
}
