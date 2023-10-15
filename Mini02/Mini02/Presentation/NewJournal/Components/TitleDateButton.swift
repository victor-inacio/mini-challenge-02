//
//  TitleDate.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 06/10/23.
//

import UIKit

class TitleDateButton: Button {
        
    init(action: (() -> Void)?) {
        super.init(title: nil, action: action)
        
        setup()
        setupAccessibility()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDateLabel() -> String {
        let dateFormatter = DateFormatter()
        
        //Estilo do dateFormatter
        dateFormatter.dateFormat = "dd 'de' MMM yyyy"
        
        // Obtenha a data atual
        let currentDate = Date()
        
        // Formatando a data atual com o estilo formatado
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate
    }
    
    private func setup() {
        setTitleColor(.fontColorNewJournalTitle, for: .normal)
        setTitle(setDateLabel(), for: .normal)
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "Nunito-Regular", size: 24)!)

    }
    
    private func setupAccessibility() {
        self.isAccessibilityElement = true
        self.accessibilityLabel = "Data Atual"
        self.accessibilityValue = setDateLabel()
    }
}
