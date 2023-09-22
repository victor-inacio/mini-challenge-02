//
//  HomeTableCell.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

import UIKit

class HomeTableCell: UITableViewCell {
    
    static var CellIdentifier = "HomeCell"
    private var background = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup(){
        self.setupBackground()
        self.contentView.backgroundColor = .systemBackground
    }
    
    func setupBackground(){
        self.contentView.addSubview(background)
        
        background.layer.cornerRadius = 8
        background.backgroundColor = .systemYellow
        background.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            background.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            background.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            background.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.8),
            background.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.8)
        ])
    }
}
