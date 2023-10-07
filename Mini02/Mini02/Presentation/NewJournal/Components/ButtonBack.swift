//
//  ButtonBack.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 06/10/23.
//

import UIKit

class ButtonBack: UIButton {
    
    var action: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    init(action: (() -> Void)?) {
        super.init(frame: .zero)
        
        setup()
        
        self.action = action
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func setup() {
        self.tintColor = .fontColorNewJournalTitle
        self.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func buttonTapped() {
        if let action = action {
            action()
        } else {
            print("The button action is nil")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
