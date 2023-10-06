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
        backgroundColor = .backgroundColorNewJournalButtonModalFeelings
        layer.masksToBounds = false

        self.addSubview(VStack)
        
        setFeelingsActions()
        setStacksConstrainsAndMargin()
        colorForCurrentMode(lightFunc: setLightMode, darkFunc: setDarkMode)
        
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
                
        VStack.addArrangedSubview(HSTackTop)
        
        VStack.isLayoutMarginsRelativeArrangement = true
        
        HSTackTop.isLayoutMarginsRelativeArrangement = true
        HSTackTop.layoutMargins = .init(top: 18, left: 9, bottom: 18, right: 9)

        
                
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
                HSTackTop.addArrangedSubview(feelings[i])
        }
    }
    
    /// Define a aparência da modal no modo light
        private func setLightMode() {
            self.layer.shadowRadius = 5 //Distância da shadow
            self.layer.shadowOpacity = 0.3
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0) // Deslocamento vertical
        }
        
    /// Define a aparência da modal no modo dark
        private func setDarkMode() {
            self.layer.shadowRadius = 20 //Distância da shadow
            self.layer.shadowOpacity = 0.7
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0) // Deslocamento vertical
        }
    
    //MARK: FUNÇÕES LÓGICAS PARA DARK E LIGHT MODE
        ///Função que recebe como parâmetro 2 funções, uma será executada caso o dispositivo esteja no dark mode  e outra no light mode.
        func colorForCurrentMode<T>(lightFunc: () -> T, darkFunc: () -> T) -> T {
            if #available(iOS 13.0, *) {
                if UITraitCollection.current.userInterfaceStyle == .dark {
                    return darkFunc()
                } else {
                    return lightFunc()
                }
            } else {
                return lightFunc()
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

#Preview(traits: .defaultLayout, body: {
    NewJournalViewController()
})

