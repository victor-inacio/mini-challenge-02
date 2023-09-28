//
//  NewJournalViewController.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 26/09/23.
//

import UIKit

//TODO: - MODULARIZAR TUDO NESSA BUDEGA

class NewJournalViewController: UIViewController {
    
    var vm:NewJournalViewModel!
    
    let titleJournal = UITextField()
    var bodyTextJournal: PlaceholderTextView! = nil
    @objc let datePicker = UIDatePicker()
    let saveButton = UIButton(type: .system)
    let placeholder = "Como foi o seu dia?\nVocê sente que conseguiu evoluir?\nSe não, qual impedimento você encontrou?"
    
    //MARK: VARS COM DADOS PARA BACKEND
    var titleJournalData:String?//Armazena entrada do usuário
    var bodyJournalData:String?//Armazena entrada do usuário
    var selectedDate: Date = .now

    override func viewDidLoad() {
        super.viewDidLoad()
        vm = NewJournalViewModel(view: self)
        setup()
    }
    
    private func setup() {
        setDatePicker()
        setTextField()
        setTextViewComponent()
        setButtonSave()
    }
    
    ///Seta configurações do titleJournal
    private func setTextField() {
        
        view.addSubview(titleJournal)
                
        //MARK: PLACEHOLDER
        let placeholder = UILabel()
        placeholder.text = "Title" //String do placeholder
        placeholder.font = .systemFont(ofSize: 50) //Tamanho da fonte
        titleJournal.placeholder =  placeholder.text
        titleJournal.autocapitalizationType = .sentences
        
        //MARK: FONT
        if let font = UIFont(name: "Helvetica-Bold", size: 32) {
            titleJournal.font = font
        }
        
        //MARK: LAYOUT
        titleJournal.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleJournal.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
            titleJournal.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            titleJournal.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            titleJournal.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    titleJournal.layer.cornerRadius = 15 //Define radius da borda
        titleJournal.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: 40)) //Determina tamanho para adicioner ícones.
        
//        titleJournal.leftViewMode = .always //Define quando o leftViewMode funcionará
//        titleJournal.font = UIFont.preferredFont(forTextStyle: .largeTitle) //Define o estilo de fonte.

        
    }
    
    func setTextViewComponent() {
        
        bodyTextJournal = PlaceholderTextView(placeholder: placeholder)

        view.addSubview(bodyTextJournal)
        
        NSLayoutConstraint.activate([
            bodyTextJournal.topAnchor.constraint(equalTo: titleJournal.bottomAnchor, constant: 20),
            bodyTextJournal.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bodyTextJournal.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            bodyTextJournal.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
        
    }
    
    private func setDatePicker() {
        datePicker.datePickerMode = .date
        
        view.addSubview(datePicker)
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            datePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
        ])
        
        datePicker.addTarget(vm , action: #selector(vm.datePickerValueChanged), for: .valueChanged)
    }
    
    private func setButtonSave() {
        view.addSubview(saveButton)
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.addTarget(vm, action: #selector(vm.buttonSaveTapped), for: .touchUpInside)
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        ])
    }
}

#Preview {
    NewJournalViewController()
}


