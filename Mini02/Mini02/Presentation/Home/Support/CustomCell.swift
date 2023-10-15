//
//  CustomCell.swift
//  Mini02
//
//  Created by Luca Lacerda on 27/09/23.
//

import UIKit

protocol CollectionViewCellDelegate: AnyObject {
    
    func onCollectionViewCellCheckChange(_ checked: Bool, task: ActiveTask)
    func onCollectionViewCellDeleted(_ task: ActiveTask)
}

class CollectionViewCell: UICollectionViewCell {
    
    static var CellIdentifier = "CustomCell"
    private var checkMark = CheckBox()
    private var background = UIView()
    private lazy var nomeAtividade: UILabel = {
        var label = UILabel()
        label.backgroundColor = .red
        label.isUserInteractionEnabled = true
        label.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "Nunito-Bold", size: 16)!)
        return label
    }()
    
    private var difficulty = CellDifficulty()
    private var task: ActiveTask!
    private var dragGesture: UIPanGestureRecognizer!
    private var initialCenter: CGPoint!
    private var percent: Float = 0
    
    weak var delegate: CollectionViewCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialCenter = self.center
        self.isUserInteractionEnabled = true
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(onSwipe))
        
        self.dragGesture = gesture
        
        self.addGestureRecognizer(self.dragGesture)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    @objc private func onSwipe(_ gesture: UIPanGestureRecognizer) {
        let state = gesture.state
        let translation = gesture.translation(in: self)
        
        
        switch(state) {
        case .began:
            print("Começou")
            
            
        case .ended:
            if (percent <= 0.3) {
                deleteCell()
            } else {
                resetCell()
            }
            
        case .possible:
            print("Possible")
        case .changed:
            let newCenter: CGPoint = .init(x: initialCenter.x + translation.x, y: center.y)
            
            self.center = newCenter
            
            percent = Float(center.x / initialCenter.x)
            layer.opacity = percent
            
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed")
        @unknown default:
            print("Default")
            
            
        }
    }
    
    private func deleteCell() {
        
        UIView.animate(withDuration: 0.2) {
            self.center.x = -100
            self.layer.opacity = 0
            self.layoutSubviews()
        } completion: { isCompleted in
            if isCompleted {
                self.delegate?.onCollectionViewCellDeleted(self.task)
            }
        }
    }
    
    private func resetCell() {
        
        
        UIView.animate(withDuration: 0.2) {
            self.center.x = self.initialCenter.x
            self.layer.opacity = 1
            self.layoutSubviews()
        } completion: { isCompleted in
        }
        
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
        delegate?.onCollectionViewCellCheckChange(checkMark.check, task: self.task)
    }
    
}

#Preview {
    CollectionViewCell()
}

