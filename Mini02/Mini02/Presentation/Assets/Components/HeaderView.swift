//
//  HeaderView.swift
//  Mini02
//
//  Created by Guilherme Nunes Lobo on 22/09/23.
//

// HeaderView.swift (UIView personalizada para o cabeçalho)
import UIKit

class HeaderView: UIView {
    let titleLabel = {
        let label = Label(text: "Suas Tarefas", font: .big)
        return label
    }()
    
    let actionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "button_fs"), for: .normal)
        button.accessibilityLabel = "Adicionar tarefa"
        button.accessibilityHint  = "Um botão que adiciona uma tarefa"
        button.sizeToFit()
        button.layer.shadowOffset = CGSize(width: 2, height: 2) //Tamanho da shadow
        button.layer.shadowRadius = 4 //Distância da shadow
        button.layer.shadowOpacity = 0.3
        button.layer.shadowColor = UIColor.black.cgColor
        return button
    }()
    
    let stackView: StackView = {
        let stackView = StackView(axis: .horizontal, distribution: .fillProportionally)
        return stackView
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
        
        
        let btnContainer = UIView()
        btnContainer.addSubview(actionButton)
        btnContainer.translatesAutoresizingMaskIntoConstraints = false
        
        translatesAutoresizingMaskIntoConstraints = false
        
        // Adiciona a UILabel titleLabel como subview da HeaderView
        stackView.addArrangedSubview(titleLabel)
        // Adiciona o UIButton actionButton como subview da HeaderView
        stackView.addArrangedSubview(btnContainer)
        
        addSubview(stackView)
        // Define as restrições de layout usando NSLayoutConstraint.activate
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            btnContainer.widthAnchor.constraint(equalTo: actionButton.widthAnchor),
            btnContainer.heightAnchor.constraint(equalTo: actionButton.heightAnchor),
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

#Preview {
    HeaderView()
}
