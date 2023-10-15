//
//  ModalTips.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 15/10/23.
//

import UIKit

class ModalTips: UIView {
    
    var isOpen = false
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .systemPink
        layer.cornerRadius = 40
        self.translatesAutoresizingMaskIntoConstraints = false

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
