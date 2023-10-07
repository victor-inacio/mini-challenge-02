//
//  ButtonSave.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 07/10/23.
//

import UIKit

class ButtonSave: Button {
    
    override init(title: String? = nil, action: (() -> Void)?) {
        super.init(title: title, action: action)
        
        setTitleColor(.fontColorNewJournalBody, for: .normal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
