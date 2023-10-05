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
        self.font = UIFont(name: "Helvetica-Bold", size: 32)
        
        self.textColor = .fontColorNewJournalTitle

        //Atridiona cor personalizada ao placeholder
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "CustomPlaceholderColor") ?? .fontColorNewJournalTitlePlaceholder,
            .font: self.font as Any
        ]
        
        self.attributedPlaceholder = NSAttributedString(string: "Title", attributes: attributes)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
