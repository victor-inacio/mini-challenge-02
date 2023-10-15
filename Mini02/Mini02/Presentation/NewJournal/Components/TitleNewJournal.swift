//
//  TitleNewJournal.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 03/10/23.
//

import UIKit

class TitleNewJournal: UITextField {
    
    init() {
        super.init(frame: .zero)
        
        self.placeholder = "Title"
        
        let dynamicFont = UIFont(name: "Nunito-Bold", size: 32)!
        self.font = UIFontMetrics.default.scaledFont(for: dynamicFont)

        self.defaultTextAttributes = [
            .foregroundColor: UIColor.fontColorNewJournalTitle,
            .font: dynamicFont
        ]
        
        setTitleNewJournalAccessibility()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .fontColorNewJournalTitle
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setTitleNewJournalAccessibility()
    }
    
    private func setTitleNewJournalAccessibility() {
        isAccessibilityElement = true
        accessibilityLabel = "Título do Diário"
        accessibilityHint = "Digite o título do seu diário aqui"
    }
}

