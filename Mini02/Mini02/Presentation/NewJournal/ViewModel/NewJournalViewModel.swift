//
//  NewJournalViewModel.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 26/09/23.
//

import Foundation

class NewJournalViewModel: ViewModel {
    let view: NewJournalViewController
    
    init(view: NewJournalViewController) {
        self.view = view
    }
    
    ///Armazena os dados inseridos pelo usuário em view.titleJournalData e view.bodyJournalData.
    @objc func buttonSaveTapped() {
        if let title = view.titleJournal.text {
            print(title)
            view.titleJournalData = title
        }
        
        if let text = view.bodyTextJournal.text {
            print(text)
            view.bodyJournalData = text
        }
    }
}
