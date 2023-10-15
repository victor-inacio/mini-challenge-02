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
        return label
    }()
    
    let titleLevel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let labelDescription: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let VSTack = StackView(axis: .horizontal, spacing: 5, alignment: .center, distribution: .equalSpacing)
    
    let titleContent = "Cumprimentar alguém com um sorriso"
    let titleLevelContent = "Nível da tarefa"
    let descriptionContent: String = "Cumprimentar alguém para muitas pessoas é um desafio, por isso nessa atividade de nível fácil, pedimos para que você cumprimente alguém com um sorriso. Algo que demonstra confiança, abertura para novas conversas e simpatia. Possibilitando assim que você se conecte mais com as pessoas."
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .systemPink
        layer.cornerRadius = 40
        translatesAutoresizingMaskIntoConstraints = false
        
                
       
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupButtonClose()
        setupTitle()
        setupLevelTitle()
        setupDivisor()
        setupLabelDescription()
    }
    
    private func setupButtonClose() {
        addSubview(buttonClose)
        buttonClose.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonClose.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            buttonClose.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
    
    private func setupTitle() {
        title.text = titleContent
        
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
    }
    
    private func setupLevelTitle() {
        titleLevel.text = titleLevelContent

        NSLayoutConstraint.activate([
            titleLevel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
    }
    
    private func setupDivisor() {
        
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
