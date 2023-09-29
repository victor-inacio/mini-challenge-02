//
//  NewJournalViewModel.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 26/09/23.
//

import Foundation
import UIKit

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
        } else {
            print("Nenhum title inseridon")
        }
        
        //guardando corpo
        if let text = view.bodyJournal.text {
            
            if text != view.placeholder {
                print(text)
                view.bodyJournalData = text
            } else {
                print("Nenhum bodyTextJournal inserido")
            }
            
        }
        
        //guardando data
        view.selectedDate = view.datePicker.date
        print("Data selecionada: \(view.selectedDate)")
    }
    
    ///Atribui a data selecionada no datePiker da view para a var selectedDate da view.
    @objc func datePickerValueChanged() {
        view.selectedDate = view.datePicker.date
    }
    
    @objc func buttonModalFeelingAction() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            
            self.startMenuAnimation()
        }
        
        view.modalFeelingIsOpen.toggle()
    }

    func startMenuAnimation() {
        view.modalFeelingIsOpen ? remakeConstraintsToCloseMenu() : remakeConstraintsToOpenMenu()
    }
    
    //AbreModal
    func remakeConstraintsToOpenMenu() {
        view.startModalFeelingAnchor.isActive = false
        view.endModalFeelingAnchor.isActive = true
    }
    
    //FechaModal
    func remakeConstraintsToCloseMenu() {
        view.endModalFeelingAnchor.isActive = false
        view.startModalFeelingAnchor.isActive = true
    }

}

#Preview {
    NewJournalViewController()
}
