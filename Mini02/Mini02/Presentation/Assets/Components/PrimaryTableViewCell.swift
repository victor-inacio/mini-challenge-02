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
    
    private let background: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 0.886, blue: 0.031, alpha: 1)
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        addSubview(background)
        background.addSubview(chevronImageView)
        self.backgroundColor = .clear
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            background.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            background.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            background.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            chevronImageView.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            chevronImageView.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -16),
            chevronImageView.widthAnchor.constraint(equalToConstant: 24),
            background.heightAnchor.constraint(equalToConstant: 80)

        ])
        
        textLabel?.font = UIFont(name: "Nunito-Bold", size: 25)
        textLabel?.textColor = .labelColorCell
        
        // Aumente a altura da célula principal
            heightAnchor.constraint(equalToConstant: 80)
    }
    
    private func updateChevron() {
        chevronImageView.image = isExpanded ? UIImage(systemName: "chevron.up") : UIImage(systemName: "chevron.down")
    }
}
