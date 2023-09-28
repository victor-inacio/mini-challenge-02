//
//  NewJournalViewController.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 26/09/23.
//

import UIKit

class NewJournalViewController: UIViewController {
    
    var vm:NewJournalViewModel!
    
    var modalFeeling = ModalFeeling()
    
    let titleJournal = UITextField()
    var bodyTextJournal: PlaceholderTextView! = nil
    @objc let datePicker = UIDatePicker()
    let saveButton = UIButton(type: .system)
    let buttonModalFeeling = UIButton(type: .system)
    let placeholder = "Como foi o seu dia?\nVocê sente que conseguiu evoluir?\nSe não, qual impedimento você encontrou?"
    
    //MARK: VARS COM DADOS PARA BACKEND
    var titleJournalData:String?//Armazena entrada do usuário
    var bodyJournalData:String?//Armazena entrada do usuário
    var selectedDate: Date = .now
    
    var modalFeelingIsOpen = false
    lazy var startModalFeelingAnchor = modalFeeling.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    lazy var endModalFeelingAnchor = modalFeeling.leadingAnchor.constraint(equalTo: view.trailingAnchor)

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
        setButtonModalFeeling()
        setModalFeelingConstrains()
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
    
    private func setTextViewComponent() {
        
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
    
    private func setButtonModalFeeling() {
        view.addSubview(buttonModalFeeling)
        
        buttonModalFeeling.setTitle("Feelings", for: .normal)
        buttonModalFeeling.addTarget(vm, action: #selector(vm.buttonModalFeelingAction), for: .touchUpInside)
        
        buttonModalFeeling.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonModalFeeling.bottomAnchor.constraint(equalTo: titleJournal.bottomAnchor),
            buttonModalFeeling.leftAnchor.constraint(equalTo: titleJournal.leftAnchor, constant: 50),
            buttonModalFeeling.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        
    }
    
    private func setModalFeelingConstrains() {
        
        view.addSubview(modalFeeling)
        
        modalFeeling.layer.cornerRadius = 40
        
        modalFeeling.translatesAutoresizingMaskIntoConstraints = false
        
//        modalFeeling.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        startModalFeelingAnchor.isActive = true
        modalFeeling.topAnchor.constraint(equalTo: titleJournal.bottomAnchor).isActive = true
        modalFeeling.widthAnchor.constraint(equalToConstant: view.bounds.width / 1.3).isActive = true
        modalFeeling.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        modalFeeling.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}

#Preview {
    NewJournalViewController()
}


/*
 
 usuários:
 BALCAO
    - FARMÁCEUTICO
    - ATENTENDETE
 
 CAIXA
    - CAIXA / ATENDENTE
 
 */
