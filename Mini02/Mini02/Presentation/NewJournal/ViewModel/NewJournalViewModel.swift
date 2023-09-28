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
    
    ///Armazena os dados inseridos pelo usuário em NewJournal().
    @objc func buttonSaveTapped() {
        
        //guardando título
        if let title = view.titleJournal.text {
            print(title)
            view.titleJournalData = title
        }
        
        //guardando corpo
        if let text = view.bodyTextJournal.text {
            print(text)
            view.bodyJournalData = text
        }
        
        //guardando data
        view.selectedDate = view.datePicker.date
        print("Data selecionada: \(view.selectedDate)")
    }
    
    ///Atribui a data selecionada no datePiker da view para a var selectedDate da view.
    @objc func datePickerValueChanged() {
        view.selectedDate = view.datePicker.date
    }
}
