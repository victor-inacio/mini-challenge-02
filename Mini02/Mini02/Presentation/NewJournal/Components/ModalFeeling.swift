//
//  ModalFeeling.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 28/09/23.
//

import UIKit

class ModalFeeling: UIView {
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = UIColor.systemMint
        layer.cornerRadius = 40

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
