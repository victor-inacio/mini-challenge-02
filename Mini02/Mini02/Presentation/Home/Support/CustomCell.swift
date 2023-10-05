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
            checkMark.heightAnchor.constraint(equalTo:  self.contentView.heightAnchor, multiplier: 0.3),
        ])
    }
    
    func config(task: Task) {
        self.addSubview(nomeAtividade)
        nomeAtividade.translatesAutoresizingMaskIntoConstraints = false
        nomeAtividade.text = task.name
        
        self.addSubview(difficulty)
        difficulty.translatesAutoresizingMaskIntoConstraints = false
        difficulty.setup(difficulty: task.difficultyLevel!)
        
        
        NSLayoutConstraint.activate([
            nomeAtividade.centerYAnchor.constraint(equalTo:     self.centerYAnchor),
            nomeAtividade.leadingAnchor.constraint(equalTo:     checkMark.trailingAnchor, constant: 12),
            nomeAtividade.widthAnchor.constraint(equalTo:       self.widthAnchor, multiplier: 0.6),
            
            difficulty.trailingAnchor.constraint(equalTo:       self.trailingAnchor, constant: -16),
            difficulty.centerYAnchor.constraint(equalTo:        self.centerYAnchor, constant: -10),
        ])
    }
}

