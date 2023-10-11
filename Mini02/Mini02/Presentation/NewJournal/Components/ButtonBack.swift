//
//  ButtonBack.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 06/10/23.
//

import UIKit

class ButtonBack: Button {
        
    init(action: (() -> Void)?) {
        super.init(title: nil, action: action, colorTitle: .fontColorNewJournalTitle)
        
        setup()
        setupAccessibility()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.tintColor = .fontColorNewJournalTitle
        self.setImage(UIImage(systemName: "arrow.left"), for: .normal)
//        titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
//        setTitle("􀄪", for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupAccessibility() {
        self.isAccessibilityElement = true
        self.accessibilityLabel = "Botão Voltar"
        self.accessibilityHint = "Toque duas vezes para voltar à tela anterior."
    }
}
