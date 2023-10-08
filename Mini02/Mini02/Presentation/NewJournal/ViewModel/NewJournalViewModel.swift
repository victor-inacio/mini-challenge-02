//
//  NewJournalViewModel.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 26/09/23.
//

import UIKit

class NewJournalViewModel: ViewModel {
    let viewController: NewJournalViewController
    
    let error: Observable<String?> = Observable(nil)
    
    //MARK: VARS COM DADOS ARMAZENADOS PARA BACKEND
    var titleJournalData:String? //Armazena título inserido
    var bodyJournalData:String? //Armazena corpo do journal inserido
    var allFeelings: Observable<[Feeling]> = Observable([])
    var feeling: Feeling?
    var selectedDate: Date = .now
    
    init(viewController: NewJournalViewController) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        fetchAllFeelings()
    }
    
    private func fetchAllFeelings() {
        
        do {
            let allFeelings = try Feeling.getAll()
            
            self.allFeelings.value = allFeelings
        } catch {
            self.error.value = error.localizedDescription
        }
        
    }
    
    func save() {
        guard validateFields() else {
            error.value = "Preencha todos os campos"
            return
        }
        
        if let titleJournalData = titleJournalData, let bodyJournalData = bodyJournalData, let feeling = feeling {
            
            do {
                try Journal.create(title: titleJournalData, text: bodyJournalData, feeling: feeling)
            } catch {
                self.error.value = error.localizedDescription
            }
        }
    }
    
    private func validateFields() -> Bool {
        guard let titleJournalData = titleJournalData, let bodyJournalData = bodyJournalData, let _ = feeling else {
            return false
        }
        
        guard !titleJournalData.isEmpty && !bodyJournalData.isEmpty else {
            return false
        }
        
        return true
    }
    
    ///Armazena os dados inseridos pelo usuário em NewJournal().
    @objc func buttonSaveTapped() {
        
        //Verifica se um título foi inserido
        if let title = viewController.titleNewJournal.text, !title.isEmpty {
            print(title)
            
            //Armazena a String na variável titleJournalData
            self.titleJournalData = title
        } else {
            return
        }
        
        //Verificando se tem algum text no bodyJournal
        if let text = viewController.bodyJournal.text, !text.isEmpty  {
            
            //Verificando se o text é diferente do placeholder
            if text != viewController.bodyJournal.placeholder {
                print(text)
                
                //Armazena a String na variável bodyJournalData
                self.bodyJournalData = text
            } else {
                return
            }
        } else {
            return
        }
        
        guard let feeling = self.feeling else {
            return
        }
        
        
    }
    
    ///Toda vez que o usuário altera a data no DatePicker, altera a var self.selectedDate
    @objc func datePickerValueChanged() {
        self.selectedDate = viewController.datePicker.date
    }
}


#Preview(traits: .defaultLayout, body: {
    NewJournalViewController()
})
