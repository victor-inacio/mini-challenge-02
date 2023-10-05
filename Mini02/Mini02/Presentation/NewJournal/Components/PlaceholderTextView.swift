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


    // Inicializador personalizado que aceita um placeholder
    init() {
        
        super.init(frame: .init(x: 0, y: 0, width: 100, height: 100), textContainer: nil)
        
        isScrollEnabled = true
        clipsToBounds = false
        translatesAutoresizingMaskIntoConstraints = false
        
        
        //MARK: DESIGN
        font = UIFont.systemFont(ofSize: 16) // Alterado para uma fonte padrão
        layer.cornerRadius = 15
        textContainerInset = UIEdgeInsets(top: 26, left: 17, bottom: 10, right: 10)
        layer.shadowOffset = CGSize(width: 2, height: 2) //Tamanho da shadow
        layer.shadowRadius = 4 //Distância da shadow
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.black.cgColor
        textColor = .fontColorNewJournalBody


        // Coloca o placeholder inicialmente
        placePlaceholder()
        delegate = self
    }

    // Função para colocar o placeholder
    func placePlaceholder() {
        placeholderOn = true
        
        text = placeholder
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
        }
    }

    // Delegado chamado quando a edição do texto termina
    func textViewDidEndEditing(_ bodyTextJournal: UITextView) {
        if (text == "") {
            placePlaceholder()
        }
    }
}
