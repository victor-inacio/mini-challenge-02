//
//  Label.swift
//  Mini02
//
//  Created by Guilherme Nunes Lobo on 26/09/23.
//

import UIKit
import Foundation
class Label: UILabel {
    
    init(localizedTextKey: String, font: UIFont? = .small) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.text = String(localized: localizedTextKey)
        self.font = UIFont(name: "Nunito-Bold", size: 24)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
 
  }




extension String {
    init(localized key: String) {
        self = NSLocalizedString(key, comment: "")
    }
}



