//
//  SecondaryTableViewCell.swift
//  Mini02
//
//  Created by Guilherme Nunes Lobo on 05/10/23.
//


import UIKit

class SecondaryTableViewCell: UITableViewCell {
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .button
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.backgroundColor = .cell
      //  contentView.layer.cornerRadius = 20
        
        addSubview(addButton)
        
        NSLayoutConstraint.activate([
            addButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            addButton.widthAnchor.constraint(equalToConstant: 60),
           // addButton.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        // Aumente a altura da célula secundária
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 100) // Ajuste a altura desejada aqui
        ])
    }
}
