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
    var text:String?
    
    init(view: NewJournalViewController) {
        self.view = view
    }
    
    @objc func buttonSaveTapped() {
        if let title = view.textField.text {
            print(title)
            self.title = title
        }
        
        if let text = view.textView.text {
            print(text)
            self.text = text
        }
    }
}
