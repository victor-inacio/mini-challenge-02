//
//  ButtonModalFeelings.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 06/10/23.
//

import UIKit

class ButtonModalFeelings: Button {
    
    //Emogi que fica no centro do button
    var feeling = FeelingViewer(feeling: "feeling_default")
    
    init(action: (() -> Void)? = nil) {
        super.init(title: nil, action: action)

        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .backgroundColorNewJournalButtonModalFeelings
        
        layer.cornerRadius = 30
                
        colorForCurrentMode(lightFunc: setLightMode, darkFunc: setDarkMode)
        
        addSubview(feeling)
        
        NSLayoutConstraint.activate([
            feeling.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            feeling.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            feeling.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.55),
            feeling.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.55)
        ])
//        setFeelingButtonAccessibility()
    }
    
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
    
    /// Define a aparência da sombra do button para o modo  light do dispositivo.
    private func setLightMode() {
        layer.shadowRadius = 5 //Distância da shadow
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0) // Deslocamento vertical
    }
    
    /// Define a aparência da sombra do button para o modo dark do dispositivo.
    private func setDarkMode() {
        print("dark executado")
        layer.shadowRadius = 20 //Distância da shadow
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 4.0) // Deslocamento vertical
    }
    
    private func setFeelingButtonAccessibility() {
        isAccessibilityElement = true
        accessibilityLabel = "Botão de sentimentos"
        accessibilityHint = "Toque para abrir a área de sentimentos"
    }
}

