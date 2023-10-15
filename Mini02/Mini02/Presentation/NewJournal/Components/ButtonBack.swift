//
//  ButtonBack.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 06/10/23.
//

import UIKit

class ButtonBack: Button {
        
    init(action: (() -> Void)?) {
        super.init(title: nil, action: action, colorTitle: .fontColorNewJournalTitle)
        
        setup()
        setupAccessibility()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.tintColor = .fontColorNewJournalTitle
        
        // Carregue a imagem
        if let backButtonImage = UIImage(named: "backButton") {
            // Defina o tamanho desejado (por exemplo, 24x24)
            let imageSize = CGSize(width: 18, height: 14.87)
            
            // Redimensione a imagem para o tamanho desejado
            if let scaledImage = backButtonImage.resize(targetSize: imageSize) {
                self.setImage(scaledImage, for: .normal)
            }
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupAccessibility() {
        self.isAccessibilityElement = true
        self.accessibilityLabel = "Botão Voltar"
        self.accessibilityHint = "Toque duas vezes para voltar à tela anterior."
    }
}

///Extensão
extension UIImage {
    func resize(targetSize: CGSize) -> UIImage? {
        let rect = CGRect(origin: .zero, size: targetSize)
        UIGraphicsBeginImageContextWithOptions(targetSize, false, 0.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
