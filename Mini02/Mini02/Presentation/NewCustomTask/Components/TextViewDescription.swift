//
//  TextViewDescription.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 10/10/23.
//

import UIKit

class TextViewDescription: UITextView, UITextViewDelegate {

    // Variável para controlar se o placeholder está ativo
    var placeholderOn = true
    var placeholder: String = "Descrição"
    
    
    weak var otherDelegate: UITextViewDelegate?

    // Inicializador personalizado que aceita um placeholder
    init() {
        
        super.init(frame: .init(x: 0, y: 0, width: 100, height: 100), textContainer: nil)
        
        isScrollEnabled = true
        isUserInteractionEnabled = true
        clipsToBounds = false
        translatesAutoresizingMaskIntoConstraints = false
        
        
        //MARK: DESIGN
//        font = UIFont.systemFont(ofSize: 16)
//        font = UIFont(name: "AnnaMN-Regular", size: 16)
        font = UIFont(name: "Helvetica", size: 17.0)
        textColor = .newCustomTaskFontPlaceholderInputs 
        backgroundColor = .newCustomTaskSectionBackground
        


        // Coloca o placeholder inicialmente
        placePlaceholder()
        delegate = self
        
//        setBodyJournalAccessibility()
    }
    

    // Função para colocar o placeholder
    func placePlaceholder() {
        placeholderOn = true
        
        text = placeholder
    }
    
    func clear() {
        placePlaceholder()
        setColorPlaceholderText()
    }

    // Remove o placeholder
    func removePlaceholder() {
        placeholderOn = false
        self.text = ""
    }

    // Inicializador necessário ao usar a classe em Interface Builder (Storyboard ou xib)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // Delegado chamado quando a edição do texto começa
    func textViewDidBeginEditing(_ bodyTextJournal: UITextView) {
        if (placeholderOn) {
            removePlaceholder()
            setColorText()
        }
    }

    // Delegado chamado quando a edição do texto termina
    func textViewDidEndEditing(_ bodyTextJournal: UITextView) {
        if (text.isEmpty) {
            placePlaceholder()
            setColorPlaceholderText()
        } else {
            otherDelegate?.textViewDidEndEditing?(self)
        }
    }
    
    ///Define a cor padrão do bodyText
    func setColorText() {
        textColor = .black
    }
    
    ///Define a cor padrão do placeholder do bodyTexr
    func setColorPlaceholderText() {
        textColor = .newCustomTaskLine
    }
    
    private func setBodyJournalAccessibility() {
        isAccessibilityElement = true
        accessibilityLabel = "Corpo do Diário"
        accessibilityHint = "Digite o conteúdo do seu diário aqui"
    }


}


#Preview(traits: .defaultLayout, body: {
    NewCustomTaskViewController()
})
