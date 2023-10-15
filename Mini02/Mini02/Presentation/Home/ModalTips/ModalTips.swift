//
//  ModalTips.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 15/10/23.
//

import UIKit

class ModalTips: UIView {
    
    var isOpen = false
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .systemPink
        layer.cornerRadius = 40
        translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "Modal funcionando!!!!"
//        label.textColor = .white
        
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Voltar", for: .normal)
        
        addSubview(label)
        addSubview(closeButton)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
