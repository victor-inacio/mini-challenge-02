//
//  CollectionViewCell.swift
//  Mini02
//
//  Created by Luca Lacerda on 23/09/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static var CellIdentifier = "CustomCell"
    private var background = UIView()
    private var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        background.backgroundColor = .systemYellow
        background.layer.cornerRadius = 8
        background.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(background)
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo:     self.contentView.topAnchor),
            background.bottomAnchor.constraint(equalTo:  self.contentView.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            background.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor)
        ])
    }
    
    func config(text: String) {
        background.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo:     background.centerXAnchor),
            label.centerYAnchor.constraint(equalTo:     background.centerYAnchor)
        ])
    }
}
