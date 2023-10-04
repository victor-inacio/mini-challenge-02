//
//  NewJournalViewController.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 26/09/23.
//

import UIKit

class NewJournalViewController: UIViewController, MVVMCView {
    
    var modelView:NewJournalViewModel!
    
    let titleJournal = UITextField()
    var bodyJournal: PlaceholderTextView! = nil
    @objc let datePicker = UIDatePicker()
    let saveButton = UIButton(type: .system)
    let placeholder = "Como foi o seu dia?\nVocê sente que conseguiu evoluir?\nSe não, qual impedimento você encontrou?"
    
    var circles: [UIView] = [UIView(), UIView(), UIView(), UIView(), UIView()]
    var buttonFeeling = UIButton()
        
    //MARK: MODAL
    var modalFeeling = ModalFeeling()
    let buttonModalFeeling = UIButton(type: .system)
    var modalFeelingIsOpen = false
    lazy var startModalFeelingAnchor = modalFeeling.leadingAnchor.constraint(equalTo: view.trailingAnchor)
    lazy var endModalFeelingAnchor = modalFeeling.trailingAnchor.constraint(equalTo: bodyJournal.trailingAnchor)
    var stackVerticalModal = StackView(axis: .vertical)
    var stackHorizontalModalTop = StackView(axis: .horizontal)
    var stackHorizontalModalBottom = StackView(axis: .horizontal, spacing: 20)

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
        setModalStacks()
        
        for i in 0...4 {
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
        
        view.addSubview(datePicker)
        
        setDatePickerConstrains()
        
        datePicker.addTarget(modelView , action: #selector(modelView.datePickerValueChanged), for: .valueChanged)
    }
    
    private func setButtonSave() {
        view.addSubview(saveButton)
        
        saveButton.setTitle("Save", for: .normal)
        
        saveButton.addTarget(modelView, action: #selector(modelView.buttonSaveTapped), for: .touchUpInside)
        
        setButtonSaveConstrains()
    }
    
    private func setModalFeeling() {
        view.addSubview(modalFeeling)
        
        setModalFeelingConstraints()
    }
    
    private func setCircle(circle: UIView) {
        circle.backgroundColor = .systemBlue
//        view.addSubview(circle)
//
        circle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            circle.topAnchor.constraint(equalTo: datePicker.bottomAnchor),
//            circle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            circle.heightAnchor.constraint(equalToConstant: 80),
            circle.widthAnchor.constraint(equalToConstant: 80),
        ])
//
//        // Defina o cornerRadius após ativar as restrições
        circle.layer.cornerRadius = 40
        circle.clipsToBounds = true
        circle.backgroundColor = .cyan
    }
    
    private func setButtonModel() {
        buttonFeeling.backgroundColor = .systemGray
        
        view.addSubview(buttonFeeling)
        
        buttonFeeling.layer.cornerRadius = 30
        buttonFeeling.clipsToBounds = true
        
        buttonFeeling.addTarget(self, action: #selector(self.buttonModalFeelingAction), for: .touchUpInside)
        
        setButtonModalConstrains()

    }
    
    private func setModalStacks() {
        
        stackVerticalModal.isHidden = true

        modalFeeling.addSubview(stackVerticalModal)
        
        
        NSLayoutConstraint.activate([
            stackVerticalModal.topAnchor.constraint(equalTo: modalFeeling.topAnchor),
            stackVerticalModal.bottomAnchor.constraint(equalTo: modalFeeling.bottomAnchor),
            stackVerticalModal.trailingAnchor.constraint(equalTo: modalFeeling.trailingAnchor),
            stackVerticalModal.leadingAnchor.constraint(equalTo: modalFeeling.leadingAnchor),
        ])
        
        stackVerticalModal.isLayoutMarginsRelativeArrangement = true
        stackVerticalModal.layoutMargins = .init(top: 20, left: 50, bottom: 20, right: 20)
        
        stackHorizontalModalTop.isLayoutMarginsRelativeArrangement = true
        stackHorizontalModalTop.layoutMargins = .init(top: 10, left: 10, bottom: 10, right: 10)
        
        stackHorizontalModalBottom.isLayoutMarginsRelativeArrangement = true
        stackHorizontalModalBottom.layoutMargins = .init(top: 0, left: 1, bottom: 0, right: 1)
        
        stackVerticalModal.addArrangedSubview(stackHorizontalModalTop)
        stackVerticalModal.addArrangedSubview(stackHorizontalModalBottom)
        
        stackHorizontalModalTop.distribution = .equalSpacing
        
//        stackVerticalModal.isHidden = true
        
        stackHorizontalModalTop.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackHorizontalModalTop.topAnchor.constraint(equalTo: stackVerticalModal.topAnchor),
            stackHorizontalModalTop.trailingAnchor.constraint(equalTo: stackVerticalModal.trailingAnchor),
            stackHorizontalModalTop.leadingAnchor.constraint(equalTo: stackVerticalModal.leadingAnchor),
        ])
//        
        stackHorizontalModalTop.addArrangedSubview(FeelingViewer(data: .init(label: "Cu", imageName: "feeling_1")))
        stackHorizontalModalTop.addArrangedSubview(FeelingViewer(data: .init(label: "Cu", imageName: "feeling_2")))
        stackHorizontalModalTop.addArrangedSubview(FeelingViewer(data: .init(label: "Cu", imageName: "feeling_3")))

        stackHorizontalModalBottom.translatesAutoresizingMaskIntoConstraints = false
        
        stackHorizontalModalBottom.addArrangedSubview(FeelingViewer(data: .init(label: "Cu", imageName: "feeling_4")))
        stackHorizontalModalBottom.addArrangedSubview(FeelingViewer(data: .init(label: "Cu", imageName: "feeling_5")))
        

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
    
    //MARK: - FUNÇÕES LÓGICAS DO FRONT-END
    
    @objc func buttonModalFeelingAction() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            
            self.startMenuAnimation()
        }
        
        self.modalFeelingIsOpen.toggle()
    }
    
    func startMenuAnimation() {
        modalFeelingIsOpen ? remakeConstraintsToCloseMenu() : remakeConstraintsToOpenMenu()
        modalFeelingIsOpen ? stackVerticalModalIsHidden() : stackVerticalModalIsNotHidden()
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
        self.stackVerticalModal.isHidden = true
    }
    
    //Deixa emogis invisiveis
    func stackVerticalModalIsNotHidden() {
        self.stackVerticalModal.isHidden = false
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

#Preview(traits: .defaultLayout, body: {
    NewJournalViewController()
})
