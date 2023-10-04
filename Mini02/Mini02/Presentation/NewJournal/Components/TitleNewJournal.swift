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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
