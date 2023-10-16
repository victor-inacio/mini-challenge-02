//
//  ModalTips.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 15/10/23.
//

import UIKit

class ModalTips: UIView {
    
    var onSwipeDown: (() -> Void)?
    
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
        
        let attributedString = NSMutableAttributedString.init(string: "Text on label")
        
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 0, length: attributedString.length));
        label.attributedText = attributedString
        
        return label
    }()
    
    let labelDescription: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.modalTipsTextDescription
        label.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "Nunito", size: 15)!)
        
        return label
    }()
    
    let HSTack = StackView(axis: .horizontal, spacing: 5, alignment: .center, distribution: .equalSpacing)
    
    var circles: [UIImageView] = [UIImageView(), UIImageView(), UIImageView()]
    
    let titleContent = "Cumprimentar alguém com um sorriso"
    let titleLevelContent = "Nível da tarefa"
    let descriptionContent: String = "Cumprimentar alguém para muitas pessoas é um desafio, por isso nessa atividade de nível fácil, pedimos para que você cumprimente alguém com um sorriso. Algo que demonstra confiança, abertura para novas conversas e simpatia. Possibilitando assim que você se conecte mais com as pessoas."
    
    
    init(actionSwipe: (() -> Void)? = nil) {
        super.init(frame: .zero)
        
        isAccessibilityElement = true
        accessibilityLabel = "Dica Modal"
        accessibilityHint = "Deslize para baixo para fechar a dica."
        
        backgroundColor = .modalTipsBackground
        layer.cornerRadius = 30
        translatesAutoresizingMaskIntoConstraints = false
        
        setup()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(closeModal))
        addGestureRecognizer(panGesture)
        
        onSwipeDown = actionSwipe
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupButtonClose()
        setupDivTitle()
        setupLevelTitle()
        setupVStack()
        setupDivisor()
        setupLabelDescription()
        setupAccessibilityModal()
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
            divTitle.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.88),
            divTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor)
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
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 54), // Ajuste o valor conforme necessário
        ])
    }
    
    private func setupLevelTitle() {
        titleLevel.text = titleLevelContent
        titleLevel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLevel)
        NSLayoutConstraint.activate([
            titleLevel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLevel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10)
        ])
        
    }
    
    private func setupDivisor() {
        for i in 0...2 {
            circles[i].image = UIImage(systemName: "circle")
            circles[i].contentMode = .scaleAspectFit
            circles[i].tintColor = .modalTipsDivisor
            circles[i].widthAnchor.constraint(equalToConstant: 15).isActive = true
            circles[i].heightAnchor.constraint(equalToConstant: 15).isActive = true
            HSTack.addArrangedSubview(circles[i])
        }
    }
    
    private func setupVStack() {
        addSubview(HSTack)
        HSTack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            HSTack.centerXAnchor.constraint(equalTo: centerXAnchor),
            //            HSTack.centerYAnchor.constraint(equalTo: centerYAnchor),
            HSTack.topAnchor.constraint(equalTo: titleLevel.bottomAnchor, constant: 33)
        ])
    }
    
    private func setupLabelDescription() {
        labelDescription.text = descriptionContent
        
        labelDescription.numberOfLines = 0
        
        addSubview(labelDescription)
        
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelDescription.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelDescription.topAnchor.constraint(equalTo: HSTack.bottomAnchor, constant: 33),
            labelDescription.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.78)
        ])
    }
    
    @objc private func closeModal(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        if translation.y > 0 {
            // Detecta o gesto de arrastar para baixo (movimento positivo no eixo Y)
            onSwipeDown?()
        }
    }
    
    //MARK: - Accessibility
    
    private func setupAccessibilityModal() {
        setupTitleAccessibility()
        setupTitleLevelAccessibility()
        setupLabelDescriptionAccessibility()
        
    }
    
    private func setupTitleAccessibility() {
        title.isAccessibilityElement = true
        title.accessibilityLabel = "Título da Dica"
        title.accessibilityValue = "Cumprimentar alguém com um sorriso"
        title.accessibilityHint = "Instruções para cumprimentar alguém com um sorriso."
    }
    
    private func setupTitleLevelAccessibility() {
        titleLevel.isAccessibilityElement = true
        titleLevel.accessibilityLabel = "Nível da Tarefa"
        titleLevel.accessibilityValue = "Fácil"
        titleLevel.accessibilityHint = "Nível da tarefa para cumprimentar alguém com um sorriso."
    }
    
    private func setupLabelDescriptionAccessibility() {
        labelDescription.isAccessibilityElement = true
        labelDescription.accessibilityLabel = "Descrição da Tarefa"
        labelDescription.accessibilityValue = "Cumprimentar alguém com um sorriso. Algo que demonstra confiança, abertura para novas conversas e simpatia. Possibilitando assim que você se conecte mais com as pessoas."
        labelDescription.accessibilityHint = "Detalhes da tarefa para cumprimentar alguém com um sorriso."
    }
    
}


//    let Handle: UIView = {
//        let handle = UIView()
//        handle.backgroundColor = .modalTipsHandle
//        handle.layer.cornerRadius = handle.bounds.height / 2
//
//        return handle
//    }()