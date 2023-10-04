//
//  ModalFeeling.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 28/09/23.
//

import UIKit

class ModalFeeling: UIView {
    
    var isOpen = false
    
    var stackVerticalModal = StackView(axis: .vertical)
    var stackHorizontalModalTop = StackView(axis: .horizontal)
    var stackHorizontalModalBottom = StackView(axis: .horizontal, spacing: 20)
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = UIColor.systemMint
        layer.cornerRadius = 40
        
        setModalStacks()

    }
    
    private func setModalStacks() {
        
        stackVerticalModal.isHidden = true

        self.addSubview(stackVerticalModal)
        
        
        NSLayoutConstraint.activate([
            stackVerticalModal.topAnchor.constraint(equalTo: self.topAnchor),
            stackVerticalModal.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackVerticalModal.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackVerticalModal.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
        
        stackVerticalModal.isLayoutMarginsRelativeArrangement = true
        stackVerticalModal.layoutMargins = .init(top: 20, left: 50, bottom: 20, right: 20)
        
        stackHorizontalModalTop.isLayoutMarginsRelativeArrangement = true
        stackHorizontalModalTop.layoutMargins = .init(top: 10, left: 10, bottom: 10, right: 10)
        
        stackHorizontalModalBottom.isLayoutMarginsRelativeArrangement = true
        stackHorizontalModalBottom.layoutMargins = .init(top: 0, left: 1, bottom: 0, right: 1)
        
        stackVerticalModal.addArrangedSubview(stackHorizontalModalTop)
        stackVerticalModal.addArrangedSubview(stackHorizontalModalBottom)
        
        stackHorizontalModalTop.distribution = .equalSpacing
                
        stackHorizontalModalTop.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackHorizontalModalTop.topAnchor.constraint(equalTo: stackVerticalModal.topAnchor),
            stackHorizontalModalTop.trailingAnchor.constraint(equalTo: stackVerticalModal.trailingAnchor),
            stackHorizontalModalTop.leadingAnchor.constraint(equalTo: stackVerticalModal.leadingAnchor),
        ])

        stackHorizontalModalTop.addArrangedSubview(FeelingViewer(data: .init(label: "Cu", imageName: "feeling_1")))
        stackHorizontalModalTop.addArrangedSubview(FeelingViewer(data: .init(label: "Cu", imageName: "feeling_2")))
        stackHorizontalModalTop.addArrangedSubview(FeelingViewer(data: .init(label: "Cu", imageName: "feeling_3")))

        stackHorizontalModalBottom.translatesAutoresizingMaskIntoConstraints = false
        
        stackHorizontalModalBottom.addArrangedSubview(FeelingViewer(data: .init(label: "Cu", imageName: "feeling_4")))
        stackHorizontalModalBottom.addArrangedSubview(FeelingViewer(data: .init(label: "Cu", imageName: "feeling_5")))
        

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
