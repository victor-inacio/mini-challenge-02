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
    private var label  = UILabel()

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
    
    func config(text: String){
        self.background.addSubview(label)
        
        self.label.text = text
        self.label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: background.centerYAnchor)
        ])
    }
    
    func setupBackground(){
        self.contentView.addSubview(background)
        
        background.layer.cornerRadius = 8
        background.backgroundColor = .systemYellow
        background.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            background.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            background.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            background.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            background.heightAnchor.constraint(equalTo: self.contentView.heightAnchor)
        ])
    }
}
