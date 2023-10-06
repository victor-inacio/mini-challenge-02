//
//  HeaderView.swift
//  Mini02
//
//  Created by Guilherme Nunes Lobo on 22/09/23.
//

// HeaderView.swift (UIView personalizada para o cabeçalho)
import UIKit

class HeaderView: UIView {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let actionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "button_fs"), for: .normal)
        button.accessibilityLabel = "Adicionar tarefa"
        button.accessibilityHint  = "Um botão que adiciona uma tarefa"
        button.sizeToFit()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Inicializador personalizado para HeaderView
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView() // Chama o método de configuração da aparência e layout
    }
    
    // Inicializador necessário ao criar HeaderView a partir de um arquivo de interface
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView() // Chama o método de configuração da aparência e layout
    }
    
    // Método privado para configurar a aparência e layout dos elementos
    private func setupView() {
        backgroundColor = .clear // Define o fundo da HeaderView como transparente
        
        titleLabel.text = "Suas Tarefas"
        
        translatesAutoresizingMaskIntoConstraints = false
        
        // Adiciona a UILabel titleLabel como subview da HeaderView
        addSubview(titleLabel)
        // Adiciona o UIButton actionButton como subview da HeaderView
        addSubview(actionButton)
        
        // Define as restrições de layout usando NSLayoutConstraint.activate
        NSLayoutConstraint.activate([
            // Restrições para a UILabel titleLabel
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), // Alinhada à esquerda com margem
            titleLabel.topAnchor.constraint(equalTo: topAnchor), // Alinhada ao topo
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor), // Alinhada à parte inferior
            
            // Restrições para o UIButton actionButton
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20), // Alinhado à direita com margem
            actionButton.centerYAnchor.constraint(equalTo: centerYAnchor), // Centralizado verticalmente
            actionButton.widthAnchor.constraint(equalToConstant: 24), // Largura da imagem
            actionButton.heightAnchor.constraint(equalToConstant: 24), // Altura da imagem
        ])
    }
    // Método para determinar a cor do texto com base no modo atual
    func textColorForCurrentMode() -> UIColor {
        if self.traitCollection.userInterfaceStyle == .dark {
            return .white // Modo escuro, cor do texto branca
        } else {
            return .black // Modo claro, cor do texto preta
        }
    }
}

