//
//  ButtonSave.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 07/10/23.
//

import UIKit

class ButtonSave: Button {
    
    override init(title: String?, action: (() -> Void)?, colorTitle: UIColor? = .fontColorNewJournalBody) {
        super.init(title: title, action: action, colorTitle: .fontColorNewJournalBody)
                
        setButtonSaveAccessibility()
        titleLabel?.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "Nunito-Regular", size: 18)!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setButtonSaveAccessibility() {
        isAccessibilityElement = true
        accessibilityLabel = "Salvar"
        accessibilityHint = "Toque para salvar o diário"
    }

}
