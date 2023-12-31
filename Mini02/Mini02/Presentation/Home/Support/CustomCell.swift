//
//  CustomCell.swift
//  Mini02
//
//  Created by Luca Lacerda on 27/09/23.
//

import UIKit 

protocol CollectionViewCellDelegate: SwipableCollectionCellDelegate {
    func onCollectionViewCellCheckChange(_ checked: Bool, task: ActiveTask)
}

class CollectionViewCell: SwipableCollectionViewCell {
    
    static var CellIdentifier = "CustomCell"
    private var checkMark = CheckBox()
    private var background = UIView()
    private lazy var nomeAtividade: UILabel = {
        var label = UILabel()
//        label.font = UIFont.preferredFont(forTextStyle: .body) // Use .body ou outro estilo apropriado
        label.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "Nunito-Bold", size: 16)!)

        return label
    }()
    
    weak var delegateB: CollectionViewCellDelegate?

    private var difficulty = CellDifficulty()
    public var task: ActiveTask!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        swipeInit()
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
    
    func config(task: ActiveTask) {
        self.addSubview(nomeAtividade)
        nomeAtividade.translatesAutoresizingMaskIntoConstraints = false
        nomeAtividade.text = task.task?.name ?? ""
        nomeAtividade.textAlignment = .left
        nomeAtividade.adjustsFontSizeToFitWidth = true
        nomeAtividade.numberOfLines = 3
//        nomeAtividade.font = UIFont(name: "Nunito-Bold", size: 16)
        self.task = task
        difficulty.translatesAutoresizingMaskIntoConstraints = false
        difficulty.setup(difficulty: task.task!.difficultyLevel!)
        self.addSubview(difficulty)
        
        checkMark.check = task.isCompleted()
        
        NSLayoutConstraint.activate([
            nomeAtividade.centerYAnchor.constraint(equalTo:     self.centerYAnchor),
            nomeAtividade.leadingAnchor.constraint(equalTo:     checkMark.trailingAnchor, constant: 6),
            nomeAtividade.widthAnchor.constraint(equalTo:       self.widthAnchor, multiplier: 0.6),
            
            difficulty.leadingAnchor.constraint(equalTo: self.nomeAtividade.trailingAnchor, constant: 12),
            difficulty.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            difficulty.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            difficulty.heightAnchor.constraint(equalTo: self.contentView.heightAnchor,multiplier: 0.2),
             
        ])
        
        self.checkMark.addTarget(self, action: #selector(onCheckMarkBtnPress), for: .touchUpInside)
    }
    
    
    fileprivate func getDark() {
        if checkMark.check == true {
            nomeAtividade.textColor = UIColor(named: "Dark")
        } else {
            nomeAtividade.textColor = UIColor(named: "Dark")
        }
    }
    
    @objc private func onCheckMarkBtnPress(){
        getDark()
        delegateB?.onCollectionViewCellCheckChange(checkMark.check, task: self.task)
    }
}

#Preview {
    CollectionViewCell()
}

