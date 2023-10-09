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
    var feeling: Observable<Feeling?> = Observable(nil)
    var selectedDate: Date = .now
    
    init(viewController: NewJournalViewController) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        fetchAllFeelings()
        self.feeling.value = self.allFeelings.value[0]
    }
    
    private func fetchAllFeelings() {
        
        do {
            let allFeelings = try Feeling.getAll()
            
            self.allFeelings.value = allFeelings
        } catch {
            self.error.value = error.localizedDescription
        }
        
    }
    
    func setDefaultEmoji() {
        guard feeling.value == nil && allFeelings.value.count > 0 else {
            return
        }
        
        feeling.value = allFeelings.value[0]
    }
    
    @objc func save(onSuccess: @escaping (() -> Void)) {
        guard validateFields() else {
            error.value = "Preencha todos os campos"
            return
        }
        
        if let titleJournalData = titleJournalData, let bodyJournalData = bodyJournalData, let feeling = feeling.value {
            
            do {
                try Journal.create(title: titleJournalData, text: bodyJournalData, feeling: feeling)
                
                onSuccess()
            } catch {
                self.error.value = error.localizedDescription
            }
        }
    }
    
    private func validateFields() -> Bool {
        guard let titleJournalData = titleJournalData, let bodyJournalData = bodyJournalData, let _ = feeling.value else {
            return false
        }
        
        guard !titleJournalData.isEmpty && !bodyJournalData.isEmpty else {
            return false
        }
        
        return true
    }
    
    
    
    ///Armazena os dados inseridos pelo usuário em NewJournal().
    
    ///Toda vez que o usuário altera a data no DatePicker, altera a var self.selectedDate
    @objc func datePickerValueChanged() {
        //        self.selectedDate = viewController.datePicker.date
    }
    
}



#Preview(traits: .defaultLayout, body: {
    NewJournalViewController()
})
