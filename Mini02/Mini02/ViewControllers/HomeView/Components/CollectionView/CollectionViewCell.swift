//
//  CollectionViewCell.swift
//  Mini02
//
//  Created by Luca Lacerda on 23/09/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        
    }
}
