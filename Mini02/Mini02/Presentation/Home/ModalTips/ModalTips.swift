//
//  ModalTips.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 15/10/23.
//

import UIKit

class ModalTips: UIView {
    
    var isOpen = false
    let buttonClose: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Voltar", for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .systemPink
        layer.cornerRadius = 40
        translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "Modal funcionando!!!!"
//        label.textColor = .white
                
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        setup()
    }
    
    private func setup() {
        setupButtonClose()
    }
    
    private func setupButtonClose() {
        addSubview(buttonClose)
        buttonClose.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonClose.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            buttonClose.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
