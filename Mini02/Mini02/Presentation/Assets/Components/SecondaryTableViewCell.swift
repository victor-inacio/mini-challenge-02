//
//  SecondaryTableViewCell.swift
//  Mini02
//
//  Created by Guilherme Nunes Lobo on 05/10/23.
//


import UIKit

class SecondaryTableViewCell: UITableViewCell {
    
    private let background: UIView = {
        let view = UIView()
        view.backgroundColor = .cell
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "plusButton"), for: .normal)
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
        addSubview(background)
        background.addSubview(addButton)
        self.backgroundColor = .clear

        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            background.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            background.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            background.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            addButton.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -16),
            addButton.widthAnchor.constraint(equalToConstant: 60),
        ])
        
        textLabel?.font = UIFont(name: "Nunito-Bold", size: 20)
        
        // Aumente a altura da célula secundária
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 80) // Ajuste a altura desejada aqui
        ])
    }
}
