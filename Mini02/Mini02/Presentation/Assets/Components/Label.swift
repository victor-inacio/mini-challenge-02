//
//  Label.swift
//  Mini02
//
//  Created by Guilherme Nunes Lobo on 26/09/23.
//

import UIKit

class Label: UILabel {
    
    init(text: String, font: UIFont? = .preferredFont(forTextStyle: .body)) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "Nunito-Bold", size: 24)!)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

