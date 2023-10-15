//
//  ModalTips.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 15/10/23.
//

import UIKit

class ModalTips: UIView {
    
    var isOpen = false
    
    let buttonClose: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Voltar", for: .normal)
        return button
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.modalTipsTitle
        label.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "Nunito-Bold", size: 26)!)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let divTitle: UIView = {
        let div = UIView()
        div.backgroundColor = .clear
        return div
    }()
    
    let titleLevel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.modalTipsTitleTaskLevel
        label.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "Nunito-Bold", size: 20)!)
        
        // Create a new Attributed String
        let attributedString = NSMutableAttributedString.init(string: "Text on label")

        // Add Underline Style Attribute.
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
            NSRange.init(location: 0, length: attributedString.length));
        label.attributedText = attributedString

        return label
    }()
     
    let labelDescription: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.modalTipsTextDescription
        label.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "Nunito", size: 15)!)
        return label
    }()
    
    let VSTack = StackView(axis: .horizontal, spacing: 5, alignment: .center, distribution: .equalSpacing)
    
    let titleContent = "Cumprimentar alguém com um sorriso"
    let titleLevelContent = "Nível da tarefa"
    let descriptionContent: String = "Cumprimentar alguém para muitas pessoas é um desafio, por isso nessa atividade de nível fácil, pedimos para que você cumprimente alguém com um sorriso. Algo que demonstra confiança, abertura para novas conversas e simpatia. Possibilitando assim que você se conecte mais com as pessoas."
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .modalTipsBackground
        layer.cornerRadius = 30
        translatesAutoresizingMaskIntoConstraints = false
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupButtonClose()
        setupDivTitle()
        setupLevelTitle()
        setupDivisor()
        setupLabelDescription()
        setupVStack()
    }
    
    private func setupButtonClose() {
        addSubview(buttonClose)
        buttonClose.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonClose.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            buttonClose.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
    
    private func setupDivTitle() {
        addSubview(divTitle)
        divTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            divTitle.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8)
        ])
        setupTitle()
    }
    
    private func setupTitle() {
        title.text = titleContent
        divTitle.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center  // Alinhe o texto ao centro

        // Adicione uma restrição de largura máxima
        let maxWidthConstraint = title.widthAnchor.constraint(lessThanOrEqualTo: divTitle.widthAnchor)
        maxWidthConstraint.priority = .defaultHigh
        maxWidthConstraint.isActive = true

        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: divTitle.centerXAnchor),
            title.topAnchor.constraint(equalTo: buttonClose.bottomAnchor, constant: 8), // Ajuste o valor conforme necessário
        ])
    }

    private func setupLevelTitle() {
        titleLevel.text = titleLevelContent
        titleLevel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLevel)
        NSLayoutConstraint.activate([
            titleLevel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLevel.topAnchor.constraint(equalTo: title.bottomAnchor)
        ])
        
    }
    
    private func setupDivisor() {
        
    }
    
    private func setupVStack() {
        addSubview(VSTack)
        VSTack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            VSTack.centerXAnchor.constraint(equalTo: centerXAnchor),
            VSTack.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupLabelDescription() {
        labelDescription.text = descriptionContent
        
        labelDescription.numberOfLines = 0
        
        addSubview(labelDescription)
        
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelDescription.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelDescription.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelDescription.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.70)
        ])
    }

}
