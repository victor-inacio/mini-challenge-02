//
//  CustomCell.swift
//  Mini02
//
//  Created by Luca Lacerda on 27/09/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static var CellIdentifier = "CustomCell"
    private var checkMark = CheckBox()
    private var background = UIView()
    private var nomeAtividade = UILabel()
    private var difficulty = CellDifficulty()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        checkMark.translatesAutoresizingMaskIntoConstraints = false

        
        self.contentView.backgroundColor = .systemBackground
        self.contentView.layer.cornerRadius = 8
        self.contentView.addSubview(checkMark)
    
        
        NSLayoutConstraint.activate([
            checkMark.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            checkMark.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            checkMark.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1)
        ])
    }
    
    func config(task: Task) {
        self.addSubview(nomeAtividade)
        nomeAtividade.translatesAutoresizingMaskIntoConstraints = false
        nomeAtividade.text = task.name
        nomeAtividade.textAlignment = .left
        nomeAtividade.adjustsFontSizeToFitWidth = true
        nomeAtividade.numberOfLines = 3
        nomeAtividade.font = UIFont(name: "Nunito-Bold", size: 16)
        
        self.addSubview(difficulty)
        difficulty.translatesAutoresizingMaskIntoConstraints = false
        difficulty.setup(difficulty: task.difficultyLevel!)
        
        
        NSLayoutConstraint.activate([
            nomeAtividade.centerYAnchor.constraint(equalTo:     self.centerYAnchor),
            nomeAtividade.leadingAnchor.constraint(equalTo:     checkMark.trailingAnchor, constant: 6),
            nomeAtividade.widthAnchor.constraint(equalTo:       self.widthAnchor, multiplier: 0.6),
            
            difficulty.leadingAnchor.constraint(equalTo: self.nomeAtividade.trailingAnchor, constant: 12),
            difficulty.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            difficulty.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            difficulty.heightAnchor.constraint(equalTo: self.contentView.heightAnchor,multiplier: 0.2),
            
        ])
    }
}

