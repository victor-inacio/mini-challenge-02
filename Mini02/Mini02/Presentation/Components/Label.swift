//
//  Label.swift
//  Mini02
//
//  Created by Guilherme Nunes Lobo on 26/09/23.
//

import UIKit

class Label: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

