//
//  PlaceholderTextView.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 28/09/23.
//

import UIKit



///TextView com placeholder, recebe como entrada String que servirá como placeholder.
class PlaceholderTextView: UITextView, UITextViewDelegate {

    // Variável para controlar se o placeholder está ativo
    var placeholderOn = true
    var placeholder: String = "Como foi o seu dia?\nVocê sente que conseguiu evoluir?\nSe não, qual impedimento você encontrou?"
    
    
    weak var otherDelegate: UITextViewDelegate?

    // Inicializador personalizado que aceita um placeholder
    init() {
        
        super.init(frame: .init(x: 0, y: 0, width: 100, height: 100), textContainer: nil)
        
        isScrollEnabled = true
        clipsToBounds = false
        translatesAutoresizingMaskIntoConstraints = false
        
        
        //MARK: DESIGN
//        font = UIFont.systemFont(ofSize: 16)
//        font = UIFont(name: "AnnaMN-Regular", size: 16)
        font = UIFontMetrics.default.scaledFont(for: UIFont(name: "Helvetica", size: 14)!)


        layer.cornerRadius = 15
        textContainerInset = UIEdgeInsets(top: 26, left: 17, bottom: 10, right: 10)
        layer.shadowOffset = CGSize(width: 2, height: 2) //Tamanho da shadow
        layer.shadowRadius = 4 //Distância da shadow
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.black.cgColor
        textColor = .fontColorNewJournalBody //Cor personalizada
        backgroundColor = .backgroundColorNewJournalBody
        


        // Coloca o placeholder inicialmente
        placePlaceholder()
        delegate = self
        
        setBodyJournalAccessibility()
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
        textColor = .fontColorNewJournalBody
    }
    
    private func setBodyJournalAccessibility() {
        isAccessibilityElement = true
        accessibilityLabel = "Corpo do Diário"
        accessibilityHint = "Digite o conteúdo do seu diário aqui"
    }

}
