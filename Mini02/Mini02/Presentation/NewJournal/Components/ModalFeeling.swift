//
//  ModalFeeling.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 28/09/23.
//

import UIKit

class ModalFeeling: UIView {
    
    var isOpen = false
    
    var VStack = StackView(axis: .vertical)
    var HSTackTop = StackView(axis: .horizontal)
    var HSTackBottom = StackView(axis: .horizontal, spacing: 20)
    
    var feelings: [FeelingViewer]!
    
    init() {
        super.init(frame: .zero)
        
        self.feelings = [
            FeelingViewer(feeling: "feeling_1"),
            FeelingViewer(feeling: "feeling_2"),
            FeelingViewer(feeling: "feeling_3"),
            FeelingViewer(feeling: "feeling_4"),
            FeelingViewer(feeling: "feeling_5"),
        ]
        
        backgroundColor = UIColor.systemMint
        layer.cornerRadius = 40
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        //Deixa por padrão o conteúdo da modelFeeling como hidden.
        VStack.isHidden = true

        self.addSubview(VStack)
        
        setFeelingsActions()
        setStacksConstrainsAndMargin()
        
        //Adiciona emogis na modal
        addFeelingsInModal()
    }
    
    private func setStacksConstrainsAndMargin() {
        //Define layout da stackVerticalModal
        NSLayoutConstraint.activate([
            VStack.topAnchor.constraint(equalTo: self.topAnchor),
            VStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            VStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            VStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
        
        HSTackBottom.translatesAutoresizingMaskIntoConstraints = false
        
        VStack.addArrangedSubview(HSTackTop)
        VStack.addArrangedSubview(HSTackBottom)
        
        VStack.isLayoutMarginsRelativeArrangement = true
        VStack.layoutMargins = .init(top: 20, left: 50, bottom: 20, right: 20)
        
        HSTackTop.isLayoutMarginsRelativeArrangement = true
        HSTackTop.layoutMargins = .init(top: 10, left: 10, bottom: 10, right: 10)
        
        HSTackBottom.isLayoutMarginsRelativeArrangement = true
        HSTackBottom.layoutMargins = .init(top: 0, left: 1, bottom: 0, right: 1)
        
                
        HSTackTop.distribution = .equalSpacing
                
        HSTackTop.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            HSTackTop.topAnchor.constraint(equalTo: VStack.topAnchor),
            HSTackTop.trailingAnchor.constraint(equalTo: VStack.trailingAnchor),
            HSTackTop.leadingAnchor.constraint(equalTo: VStack.leadingAnchor),
        ])
        
    }
    
    private func setFeelingsActions() {
        // Adicione ações para cada FeelingViewer
        for (index, feelingViewer) in feelings.enumerated() {
            
            //Dá ao Feeling uma identificação única
            feelingViewer.tag = index //.tag é usado para identificar views de forma única.
            
            //Cria a func para o Feeling
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(feelingViewerTapped(_:)))
            
            //Adiciona a func ao Feeling
            feelingViewer.addGestureRecognizer(tapGesture)
        }
    }
    
    private func addFeelingsInModal() {
        for i in 0..<feelings.count {
            if i < 3 {
                HSTackTop.addArrangedSubview(feelings[i])
            } else {
                HSTackBottom.addArrangedSubview(feelings[i])
            }
        }
    }
    
    ///Func acionada quando umd os sentimentos é clicado
    @objc func feelingViewerTapped(_ feeling: UITapGestureRecognizer) {

        if let index = feeling.view?.tag {
            
            // O 'index' corresponde ao FeelingViewer que foi tocado
            print("FeelingViewer \(index) foi tocado.")
        }
    }
}
