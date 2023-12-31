//
//  ModalFeeling.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 28/09/23.
//

import UIKit

protocol ModalFeeligDelegate: AnyObject {
    func onFeelingClicked(_ feeling: Feeling) -> Void
}

class ModalFeeling: UIView {
    
    var isOpen = false
    
    var VStack = StackView(axis: .vertical)
    var HSTackTop = StackView(axis: .horizontal)
    
    weak var delegate: ModalFeeligDelegate?
    
    var feelings: [Feeling]! = [] {
        didSet {
            setFeelingsActions()
            setStacksConstrainsAndMargin()
            colorForCurrentMode(lightFunc: setLightMode, darkFunc: setDarkMode)
            
            //Adiciona emogis na modal
            addFeelingsInModal()
        }
    }
    var feelingViewers: [FeelingViewer] = []
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = UIColor.systemMint
        layer.cornerRadius = 40
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        //Deixa por padrão o conteúdo da modelFeeling como hidden.
        VStack.isHidden = self.isOpen
        backgroundColor = .backgroundColorNewJournalButtonModalFeelings
        layer.masksToBounds = false
        self.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(VStack)
        
        setModalFeelingAccessibility()
    
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
        HSTackTop.layoutMargins = .init(top: 10, left: 16, bottom: 10, right: 16)
                
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
        for (index, feeling) in feelings.enumerated() {
            
            let feelingViewer = FeelingViewer(feeling: feeling)
            
            //Dá ao Feeling uma identificação única
            feelingViewer.tag = index //.tag é usado para identificar views de forma única.
            
            //Cria a func para o Feeling
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(feelingViewerTapped(_:)))
            
            //Adiciona a func ao Feeling
            feelingViewer.addGestureRecognizer(tapGesture)
            
            feelingViewers.append(feelingViewer)
        }
    }
    
    private func addFeelingsInModal() {
        for feelingViewer in feelingViewers {
            feelingViewer.isUserInteractionEnabled = true
                HSTackTop.addArrangedSubview(feelingViewer)
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
    
            delegate?.onFeelingClicked(feelings.first(where: { _feeling in
                (feeling.view as! FeelingViewer).feeling == _feeling.imageName
            })!)
        }
    }
    
    
    private func setModalFeelingAccessibility() {
        isAccessibilityElement = true
        accessibilityLabel = "Modal de seleção de Sentimento"
        accessibilityHint = "Escolha como você está se sentindo aqui"
    }

    
}

#Preview{
    NewJournalViewController()
}

