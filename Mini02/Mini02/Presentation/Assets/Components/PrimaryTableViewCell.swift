//
//  PrimaryTableViewCell.swift
//  Mini02
//
//  Created by Guilherme Nunes Lobo on 05/10/23.
//

// PrimaryTableViewCell.swift
import UIKit

class PrimaryTableViewCell: UITableViewCell {

    var isExpanded = false {
        didSet {
            updateChevron()
        }
    }
    
    var cellInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32) {
        didSet {
            setNeedsLayout()
        }
    }

    private let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.down")
        imageView.tintColor = .labelColors
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
       // contentView.layer.cornerRadius = 20

        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(backgroundView)

        addSubview(chevronImageView)

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: cellInsets.left),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -cellInsets.right),
            
            // Defina a altura da célula aqui (por exemplo, 60 pontos).
            heightAnchor.constraint(equalToConstant: 160),

            chevronImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevronImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -cellInsets.right),
            chevronImageView.widthAnchor.constraint(equalToConstant: 24),
            chevronImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }


    private func updateChevron() {
        chevronImageView.image = isExpanded ? UIImage(systemName: "chevron.up") : UIImage(systemName: "chevron.down")
    }
}
