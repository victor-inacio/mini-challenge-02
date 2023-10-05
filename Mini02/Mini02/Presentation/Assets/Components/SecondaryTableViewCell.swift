//
//  SecondaryTableViewCell.swift
//  Mini02
//
//  Created by Guilherme Nunes Lobo on 05/10/23.
//

// SecondaryTableViewCell.swift

import UIKit

class SecondaryTableViewCell: UITableViewCell {

    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .labelColors
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
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 1, green: 0.886, blue: 0.031, alpha: 1)
        backgroundView.layer.cornerRadius = 20
        selectedBackgroundView = backgroundView

        contentView.addSubview(addButton)

        NSLayoutConstraint.activate([
            addButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            addButton.widthAnchor.constraint(equalToConstant: 60),
            addButton.heightAnchor.constraint(equalToConstant: 60),

            // Defina a altura da célula aqui (por exemplo, 60 pontos).
            heightAnchor.constraint(equalToConstant: 160),
        ])
    }

}
