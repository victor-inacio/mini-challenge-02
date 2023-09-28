//
//  NewJournalViewModel.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 26/09/23.
//

import Foundation

class NewJournalViewModel: ViewModel {
    let view: NewJournalViewController
    
    var title:String?
    var body:String?
    
    init(view: NewJournalViewController) {
        self.view = view
    }
    
    @objc func buttonSaveTapped() {
        if let title = view.titleJournal.text {
            print(title)
            self.title = title
        }
        
        if let text = view.bodyTextJournal.text {
            print(text)
            self.body = text
        }
    }
}
