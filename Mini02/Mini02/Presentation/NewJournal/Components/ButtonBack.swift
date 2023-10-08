//
//  ButtonBack.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 06/10/23.
//

import UIKit

class ButtonBack: Button {
        
    init(action: (() -> Void)?) {
        super.init(title: nil, action: action)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.tintColor = .fontColorNewJournalTitle
        self.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
