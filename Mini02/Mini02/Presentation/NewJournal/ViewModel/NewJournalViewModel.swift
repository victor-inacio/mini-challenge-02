//
//  NewJournalViewModel.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 26/09/23.
//

import Foundation
import UIKit

class NewJournalViewModel: ViewModel {
    let viewController: NewJournalViewController
    
    init(viewController: NewJournalViewController) {
        self.viewController = viewController
    }
    
    ///Armazena os dados inseridos pelo usuário em NewJournal().
    @objc func buttonSaveTapped() {
        
        //guardando título
        if let title = viewController.titleJournal.text {
            print(title)
            viewController.titleJournalData = title
        } else {
            print("Nenhum title inseridon")
        }
        
        //guardando corpo
        if let text = viewController.bodyJournal.text {
            
            if text != viewController.placeholder {
                print(text)
                viewController.bodyJournalData = text
            } else {
                print("Nenhum bodyTextJournal inserido")
            }
            
        }
        
        //guardando data
        viewController.selectedDate = viewController.datePicker.date
        print("Data selecionada: \(viewController.selectedDate)")
    }
    
    ///Atribui a data selecionada no datePiker da view para a var selectedDate da view.
    @objc func datePickerValueChanged() {
        viewController.selectedDate = viewController.datePicker.date
    }
    
    @objc func buttonModalFeelingAction() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            
            self.startMenuAnimation()
        }
        
        viewController.modalFeelingIsOpen.toggle()
    }

    func startMenuAnimation() {
        viewController.modalFeelingIsOpen ? remakeConstraintsToCloseMenu() : remakeConstraintsToOpenMenu()
        viewController.modalFeelingIsOpen ? stackVerticalModalIsHidden() : stackVerticalModalIsNotHidden()
        viewController.view.layoutSubviews()
    }
    
    //AbreModal
    func remakeConstraintsToOpenMenu() {
        viewController.startModalFeelingAnchor.isActive = false
        viewController.endModalFeelingAnchor.isActive = true
    }
    
    //FechaModal
    func remakeConstraintsToCloseMenu() {
        viewController.endModalFeelingAnchor.isActive = false
        viewController.startModalFeelingAnchor.isActive = true
    }
    
    //Deixa emogis visiveis
    func stackVerticalModalIsHidden() {
        viewController.stackVerticalModal.isHidden = true
    }
    
    //Deixa emogis invisiveis
    func stackVerticalModalIsNotHidden() {
        viewController.stackVerticalModal.isHidden = false
    }


}


#Preview(traits: .defaultLayout, body: {
    NewJournalViewController()
})
