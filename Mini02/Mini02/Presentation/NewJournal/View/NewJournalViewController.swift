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
    var buttonBack = UIButton()

        
    //MARK: MODAL
    var modalFeeling = ModalFeeling()
    let buttonModalFeeling = UIButton(type: .system)
    lazy var startModalFeelingAnchor = modalFeeling.leadingAnchor.constraint(equalTo: view.trailingAnchor)
    lazy var endModalFeelingAnchor = modalFeeling.trailingAnchor.constraint(equalTo: bodyJournal.trailingAnchor)
    
    //MARK: COLORS
    let titleColor = UIColor(red: 255/255, green: 30/255, blue: 30/255, alpha: 1.0)


    override func viewDidLoad() {
        super.viewDidLoad()
        modelView = NewJournalViewModel(viewController: self)
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .background
        setTabBar()
        setDatePicker()
        setTitleJournal()
        setBodyJournal()
        setButtonSave()
        setModalFeeling()
        setButtonModel()
        setButtonBack()

    }
    
    ///Seta configurações do titleJournal
    private func setTitleJournal() {

        view.addSubview(titleNewJournal)
        
        setTitleJournalConstrains()
    }
    
    private func setBodyJournal() {
        
        //recebe branco como cor
        bodyJournal.backgroundColor = .backgroundColorNewJournalBody
        
        view.addSubview(bodyJournal)
        
        setBodyJournalConstrains()
    }
    
    private func setDatePicker() {
        datePicker.datePickerMode = .date
        
        view.addSubview(datePicker)
        
        setDatePickerConstrains()
        
        datePicker.addTarget(modelView , action: #selector(modelView.datePickerValueChanged), for: .valueChanged)
    }
    
    private func setButtonBack() {
        buttonBack.setTitle("teste", for: .normal)
        buttonBack.setImage(UIImage(systemName: "pencil"), for: .normal)
        buttonBack.addTarget(self, action: #selector(returnToJournal), for: .touchUpInside)
        buttonBack.backgroundColor = .systemBlue

        let customBackButton = UIBarButtonItem(customView: buttonBack)
        navigationItem.leftBarButtonItem = customBackButton
    }
    
    private func setButtonSave() {
        view.addSubview(buttonSave)
                
        buttonSave.setTitle("Save", for: .normal)
        
        buttonSave.setTitleColor(.fontColorNewJournalBody, for: .normal)
        
        
        
        buttonSave.addTarget(modelView, action: #selector(modelView.buttonSaveTapped), for: .touchUpInside)
        
        setButtonSaveConstrains()
    }
    
    private func setModalFeeling() {
        view.addSubview(modalFeeling)
        
        setModalFeelingConstraints()
    }
    
    private func setButtonModel() {
        buttonFeeling.backgroundColor = .backgroundColorNewJournalButtonModalFeelings
        
        view.addSubview(buttonFeeling)
        
        buttonFeeling.layer.cornerRadius = 30
        
        //Observa o modo do dispositivo e define o shadow.
        colorForCurrentMode(lightFunc: setButtonModelShadowLightMode, darkFunc: setButtonModelShadowDarkMode)
        
        buttonFeeling.addTarget(self, action: #selector(self.buttonModalFeelingAction), for: .touchUpInside)
        
        setButtonModalConstrains()

    }
    
    /// Define a aparência da sombra do NewJounral.buttonModel no modo light do dispositivo.
        private func setButtonModelShadowLightMode() {
            buttonFeeling.layer.shadowRadius = 5 //Distância da shadow
            buttonFeeling.layer.shadowOpacity = 0.3
            buttonFeeling.layer.shadowColor = UIColor.black.cgColor
            buttonFeeling.layer.shadowOffset = CGSize(width: 0.0, height: 1.0) // Deslocamento vertical
        }
        
        /// Define a aparência da sombra do NewJounral.buttonModel no modo dark do dispositivo.
        private func setButtonModelShadowDarkMode() {
            buttonFeeling.layer.shadowRadius = 20 //Distância da shadow
            buttonFeeling.layer.shadowOpacity = 0.7
            buttonFeeling.layer.shadowColor = UIColor.black.cgColor
            buttonFeeling.layer.shadowOffset = CGSize(width: 0.0, height: 3.0) // Deslocamento vertical
        }
    
    /// Oculta a tabBar
    private func setTabBar() {
        self.tabBarController?.tabBar.isHidden = true
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
    
    @objc func returnToJournal() {
        print("p")
    }
    
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
    //
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
        self.modalFeeling.VStack.isHidden = true
    }
    
    //Deixa emogis invisiveis
    func stackVerticalModalIsNotHidden() {
        self.modalFeeling.VStack.isHidden = false
    }
    
    //MARK: FUNÇÕES LÓGICAS PARA DARK E LIGHT MODE
        ///Função que recebe como parâmetro 2 funções, uma será executada caso o dispositivo esteja no dark mode  e outra no light mode.
        func colorForCurrentMode<T>(lightFunc: () -> T, darkFunc: () -> T) -> T {
            if #available(iOS 13.0, *) {
                if UITraitCollection.current.userInterfaceStyle == .dark {
                    return darkFunc()
                } else {
                    return lightFunc()
                }
            } else {
                return lightFunc()
            }
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
