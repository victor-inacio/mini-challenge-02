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
    var bodyJournal: PlaceholderTextView! = nil
    @objc let datePicker = UIDatePicker()
    let saveButton = UIButton(type: .system)
    let buttonModalFeeling = UIButton(type: .system)
    let placeholder = "Como foi o seu dia?\nVocê sente que conseguiu evoluir?\nSe não, qual impedimento você encontrou?"
    
    var circles: [UIView] = [UIView(), UIView(), UIView()]
    var buttonFeeling = UIButton()
    
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
        setTitleJournal()
        setBodyJournal()
        setButtonSave()
        //setButtonModalFeeling()
        setModalFeeling()
        setButtonModel()
        
        for i in 0...2 {
            setCircle(circle: circles[i])
        }
    }
    
    //TODO: COMPONENTIZAR TITLE
    ///Seta configurações do titleJournal
    private func setTitleJournal() {
        
        view.addSubview(titleJournal)
                
        titleJournal.placeholder = "Title"
        
        titleJournal.font = UIFont(name: "Helvetica-Bold", size: 32)
        
        setTitleJournalConstrains()
        
    }
    
    private func setBodyJournal() {
        
        bodyJournal = PlaceholderTextView(placeholder: placeholder)

        view.addSubview(bodyJournal)
        
        setBodyJournalConstrains()
    }
    
    private func setDatePicker() {
        datePicker.datePickerMode = .date
//        datePicker.preferredDatePickerStyle = .wheels
        
        
        view.addSubview(datePicker)
        
        setDatePickerConstrains()
        
        datePicker.addTarget(vm , action: #selector(vm.datePickerValueChanged), for: .valueChanged)
    }
    
    private func setButtonSave() {
        view.addSubview(saveButton)
        
        saveButton.setTitle("Save", for: .normal)
        
        saveButton.addTarget(vm, action: #selector(vm.buttonSaveTapped), for: .touchUpInside)
        
        setButtonSaveConstrains()
    }
    
    private func setButtonModalFeeling() {
        view.addSubview(buttonModalFeeling)
        
        buttonModalFeeling.setTitle("Feelings", for: .normal)
        
        buttonModalFeeling.addTarget(vm, action: #selector(vm.buttonModalFeelingAction), for: .touchUpInside)
        
        setButtonModalFeelingConstrains()
    }
    
    private func setModalFeeling() {
        
        view.addSubview(modalFeeling)
        
        modalFeeling.layer.cornerRadius = 40
        
        setModalFeelingConstraints()

    }
    
    private func setCircle(circle: UIView) {
        circle.backgroundColor = .systemBlue
//        view.addSubview(circle)
//
//        circle.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            circle.topAnchor.constraint(equalTo: datePicker.bottomAnchor),
//            circle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            circle.heightAnchor.constraint(equalToConstant: 80),
//            circle.widthAnchor.constraint(equalToConstant: 80),
//        ])
//
//        // Defina o cornerRadius após ativar as restrições
//        circle.layer.cornerRadius = 40
//        circle.clipsToBounds = true
    }
    
    private func setButtonModel() {
        buttonFeeling.backgroundColor = .systemGray
        
        view.addSubview(buttonFeeling)
        
        buttonFeeling.layer.cornerRadius = 30
        buttonFeeling.clipsToBounds = true
        
        buttonFeeling.addTarget(vm, action: #selector(vm.buttonModalFeelingAction), for: .touchUpInside)
        
        setButtonModalConstrains()

        
    }
    
    //MARK: - CONSTRAINS
    
    private func setTitleJournalConstrains() {
        titleJournal.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleJournal.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
            titleJournal.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            titleJournal.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            titleJournal.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setBodyJournalConstrains() {
        bodyJournal.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bodyJournal.topAnchor.constraint(equalTo: titleJournal.bottomAnchor, constant: 20),
            bodyJournal.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bodyJournal.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            bodyJournal.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])

    }
    
    private func setDatePickerConstrains() {
        datePicker.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            datePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        ])
    }
    
    private func setButtonSaveConstrains() {
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        ])
    }
    
    private func setButtonModalFeelingConstrains() {
        buttonModalFeeling.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonModalFeeling.bottomAnchor.constraint(equalTo: titleJournal.bottomAnchor),
            buttonModalFeeling.leftAnchor.constraint(equalTo: titleJournal.leftAnchor, constant: 50),
            buttonModalFeeling.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setModalFeelingConstraints() {
        modalFeeling.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            startModalFeelingAnchor,
            modalFeeling.topAnchor.constraint(equalTo: bodyJournal.topAnchor),
            modalFeeling.widthAnchor.constraint(equalToConstant: view.bounds.width / 1.3),
            modalFeeling.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            modalFeeling.heightAnchor.constraint(equalToConstant: 200), //tamanho
        ])
    }
    
    private func setButtonModalConstrains() {
        buttonFeeling.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonFeeling.topAnchor.constraint(equalTo: datePicker.topAnchor),
            buttonFeeling.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buttonFeeling.heightAnchor.constraint(equalToConstant: 60),
            buttonFeeling.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    //MARK: - ACCESSIBILITY
    
    func setDatePickerAccessibility() {
        datePicker.isAccessibilityElement = true
        datePicker.accessibilityLabel = "Selecione uma data"
        datePicker.accessibilityHint = "Toque duas vezes para escolher uma data"
    }

    func setSaveButtonAccessibility() {
        saveButton.isAccessibilityElement = true
        saveButton.accessibilityLabel = "Salvar"
        saveButton.accessibilityHint = "Toque para salvar o diário"
    }

    func setFeelingButtonAccessibility() {
        buttonModalFeeling.isAccessibilityElement = true
        buttonModalFeeling.accessibilityLabel = "Sentimento"
        buttonModalFeeling.accessibilityHint = "Toque para abrir a tela de seleção de sentimento"
    }

    func setTitleJournalAccessibility() {
        titleJournal.isAccessibilityElement = true
        titleJournal.accessibilityLabel = "Título do Diário"
        titleJournal.accessibilityHint = "Digite o título do seu diário aqui"
    }

    func setBodyJournalAccessibility() {
        bodyJournal.isAccessibilityElement = true
        bodyJournal.accessibilityLabel = "Corpo do Diário"
        bodyJournal.accessibilityHint = "Digite o conteúdo do seu diário aqui"
    }

    func setModalFeelingAccessibility() {
        modalFeeling.isAccessibilityElement = true
        modalFeeling.accessibilityLabel = "Seleção de Sentimento"
        modalFeeling.accessibilityHint = "Escolha o seu sentimento atual aqui"
    }

    func setCircleAccessibility() {
        for (index, circle) in circles.enumerated() {
            circle.isAccessibilityElement = true
            circle.accessibilityLabel = "Círculo \(index + 1)"
            circle.accessibilityHint = "Toque para selecionar"
        }
    }

    func setFeelingButtonInCircleAccessibility() {
        buttonFeeling.isAccessibilityElement = true
        buttonFeeling.accessibilityLabel = "Seleção de Sentimento"
        buttonFeeling.accessibilityHint = "Toque para abrir a tela de seleção de sentimento"
    }


}

#Preview {
    NewJournalViewController()
}
