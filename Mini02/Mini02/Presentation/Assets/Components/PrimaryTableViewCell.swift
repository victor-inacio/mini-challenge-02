//
//  PrimaryTableViewCell.swift
//  Mini02
//
//  Created by Guilherme Nunes Lobo on 05/10/23.
//

import UIKit

class PrimaryTableViewCell: UITableViewCell {
    
    var isExpanded = false {
        didSet {
            updateChevron()
        }
    }
    
    private let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.down")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        contentView.backgroundColor = UIColor(red: 1, green: 0.886, blue: 0.031, alpha: 1)
       contentView.layer.cornerRadius = 20
        textLabel?.font = UIFont(name: "Nunito-Bold", size: 16)
        textLabel?.textColor = .labelColorCell

        addSubview(chevronImageView)
        
        NSLayoutConstraint.activate([
            chevronImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevronImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            chevronImageView.widthAnchor.constraint(equalToConstant: 24),
        ])
        
        // Aumente a altura da célula principal
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 100) // Ajuste a altura desejada aqui
        ])
    }
    
    private func updateChevron() {
        chevronImageView.image = isExpanded ? UIImage(systemName: "chevron.up") : UIImage(systemName: "chevron.down")
    }
}
