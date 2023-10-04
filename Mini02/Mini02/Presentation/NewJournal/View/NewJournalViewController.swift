//
//  NewJournalViewController.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 26/09/23.
//

import UIKit

class NewJournalViewController: UIViewController, MVVMCView {
    
    var modelView:NewJournalViewModel!
    
    let titleNewJournal = TitleNewJournal()
    let bodyJournal = PlaceholderTextView()
    @objc let datePicker = UIDatePicker()
    
    let buttonSave = UIButton(type: .system)
    var buttonFeeling = UIButton()
        
    //MARK: MODAL
    var modalFeeling = ModalFeeling()
    let buttonModalFeeling = UIButton(type: .system)
    lazy var startModalFeelingAnchor = modalFeeling.leadingAnchor.constraint(equalTo: view.trailingAnchor)
    lazy var endModalFeelingAnchor = modalFeeling.trailingAnchor.constraint(equalTo: bodyJournal.trailingAnchor)


    override func viewDidLoad() {
        super.viewDidLoad()
        modelView = NewJournalViewModel(viewController: self)
        setup()
    }
    
    private func setup() {
        setDatePicker()
        setTitleJournal()
        setBodyJournal()
        setButtonSave()
        setModalFeeling()
        setButtonModel()
    }
    
    ///Seta configurações do titleJournal
    private func setTitleJournal() {
        view.addSubview(titleNewJournal)
        
        setTitleJournalConstrains()
    }
    
    private func setBodyJournal() {
        
        view.addSubview(bodyJournal)
        
        setBodyJournalConstrains()
    }
    
    private func setDatePicker() {
        datePicker.datePickerMode = .date
        
        view.addSubview(datePicker)
        
        setDatePickerConstrains()
        
        datePicker.addTarget(modelView , action: #selector(modelView.datePickerValueChanged), for: .valueChanged)
    }
    
    private func setButtonSave() {
        view.addSubview(buttonSave)
        
        buttonSave.setTitle("Save", for: .normal)
        
        buttonSave.addTarget(modelView, action: #selector(modelView.buttonSaveTapped), for: .touchUpInside)
        
        setButtonSaveConstrains()
    }
    
    private func setModalFeeling() {
        view.addSubview(modalFeeling)
        
        setModalFeelingConstraints()
    }
    
    private func setButtonModel() {
        buttonFeeling.backgroundColor = .systemGray
        
        view.addSubview(buttonFeeling)
        
        buttonFeeling.layer.cornerRadius = 30
        buttonFeeling.clipsToBounds = true
        
        buttonFeeling.addTarget(self, action: #selector(self.buttonModalFeelingAction), for: .touchUpInside)
        
        setButtonModalConstrains()

    }
    

    //MARK: - CONSTRAINS
    
    private func setTitleJournalConstrains() {
        titleNewJournal.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleNewJournal.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
            titleNewJournal.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            titleNewJournal.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            titleNewJournal.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setBodyJournalConstrains() {

        NSLayoutConstraint.activate([
            bodyJournal.topAnchor.constraint(equalTo: titleNewJournal.bottomAnchor, constant: 20),
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
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonSave.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonSave.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        ])
    }
    
    private func setButtonModalFeelingConstrains() {
        buttonModalFeeling.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonModalFeeling.bottomAnchor.constraint(equalTo: titleNewJournal.bottomAnchor),
            buttonModalFeeling.leftAnchor.constraint(equalTo: titleNewJournal.leftAnchor, constant: 50),
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
    
    //MARK: - FUNÇÕES LÓGICAS DO FRONT-END
    
    @objc func buttonModalFeelingAction() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            
            self.startMenuAnimation()
        }
        
        self.modalFeeling.isOpen.toggle()
    }
    
    func startMenuAnimation() {
        modalFeeling.isOpen ? remakeConstraintsToCloseMenu() : remakeConstraintsToOpenMenu()
        modalFeeling.isOpen ? stackVerticalModalIsHidden() : stackVerticalModalIsNotHidden()
        view.layoutSubviews()
    }
    
    //AbreModal
    func remakeConstraintsToOpenMenu() {
        self.startModalFeelingAnchor.isActive = false
        self.endModalFeelingAnchor.isActive = true
    }
    
    //FechaModal
    func remakeConstraintsToCloseMenu() {
        self.endModalFeelingAnchor.isActive = false
        self.startModalFeelingAnchor.isActive = true
    }
    
    //Deixa emogis visiveis
    func stackVerticalModalIsHidden() {
        self.modalFeeling.stackVerticalModal.isHidden = true
    }
    
    //Deixa emogis invisiveis
    func stackVerticalModalIsNotHidden() {
        self.modalFeeling.stackVerticalModal.isHidden = false
    }

    
    //MARK: - ACCESSIBILITY
    
    func setDatePickerAccessibility() {
        datePicker.isAccessibilityElement = true
        datePicker.accessibilityLabel = "Selecione uma data"
        datePicker.accessibilityHint = "Toque duas vezes para escolher uma data"
    }

    func setSaveButtonAccessibility() {
        buttonSave.isAccessibilityElement = true
        buttonSave.accessibilityLabel = "Salvar"
        buttonSave.accessibilityHint = "Toque para salvar o diário"
    }

    func setFeelingButtonAccessibility() {
        buttonModalFeeling.isAccessibilityElement = true
        buttonModalFeeling.accessibilityLabel = "Sentimento"
        buttonModalFeeling.accessibilityHint = "Toque para abrir a tela de seleção de sentimento"
    }

    func setTitleJournalAccessibility() {
        titleNewJournal.isAccessibilityElement = true
        titleNewJournal.accessibilityLabel = "Título do Diário"
        titleNewJournal.accessibilityHint = "Digite o título do seu diário aqui"
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

    func setFeelingButtonInCircleAccessibility() {
        buttonFeeling.isAccessibilityElement = true
        buttonFeeling.accessibilityLabel = "Seleção de Sentimento"
        buttonFeeling.accessibilityHint = "Toque para abrir a tela de seleção de sentimento"
    }


}

#Preview(traits: .defaultLayout, body: {
    NewJournalViewController()
})
