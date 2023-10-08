//
//  ButtonSave.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 07/10/23.
//

import UIKit

class ButtonSave: Button {
    
    override init(title: String?, action: (() -> Void)?) {
        super.init(title: title, action: action)
        
        setTitleColor(.fontColorNewJournalBody, for: .normal)
        
//        setButtonSaveAccessibility()
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
