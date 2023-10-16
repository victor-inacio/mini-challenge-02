import UIKit

class ViewJournalViewController: UIViewController, MVVMCView {
    
    
    var viewModel: ViewJournalViewModel!
    
    var titleDate: TitleDateButton!
    let calendarPicker = CallendarPickerViewModal()
    var selectedDate: Date?
    
    let titleNewJournal = TitleNewJournal()
    let bodyJournal = PlaceholderTextView()
    let datePicker = UIDatePicker()
    
    var buttonSave: ButtonSave!
    var buttonModalFeelings = ButtonModalFeelings()
    var buttonBack = ButtonBack(action: nil)
    let buttonChevron = UIButton(type: .system)
    
    var journal: Journal!
    
    //MARK: MODAL
    var modalFeeling = ModalFeeling()
    //    let buttonModalFeeling = UIButton(type: .system)
    lazy var closeAnchorModalFeeling = modalFeeling.leadingAnchor.constraint(equalTo: view.trailingAnchor)
    lazy var endModalFeelingAnchor = modalFeeling.trailingAnchor.constraint(equalTo: buttonModalFeelings.trailingAnchor)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        setup()
        
        titleDate.date = journal.created_at!
        titleNewJournal.text = journal.text
        bodyJournal.text = journal.text
        self.buttonModalFeelings.feeling.feeling = journal.feeling?.imageName
        
        bind()
        viewModel.viewDidLoad()
    } 
    
    private func bind() {
      
    }
    
    private func setEmojis() {
//        modalFeeling.feelings = viewModel.allFeelings.value
    }
    
    
    private func setup() {
        view.backgroundColor = .background
        setTabBar()
        setDatePicker()
        setTitleJournal()
        setTapToHideKeyboard()
        setBodyJournal()
        setButtons()
        setModalFeeling()
        setNavigationController()
    }
    
    ///Seta configurações do titleJournal
    private func setTitleJournal() {
        view.addSubview(titleNewJournal)
        titleNewJournal.isUserInteractionEnabled = false
        setTitleJournalConstrains()
    }
    
    private func setBodyJournal() {
        view.addSubview(bodyJournal)
        bodyJournal.isUserInteractionEnabled = false
        setBodyJournalConstrains()
    }
    
    private func setDatePicker() {
        view.addSubview(datePicker)
        datePicker.isUserInteractionEnabled = false
        setDatePickerConstrains()
        datePicker.isHidden = true
    }
    
    private func setNavigationController() {
        setButtonBack()
        setTitleDate()
        setButtonChevron()
    }
    
    private func setButtons() {
        setButtonFeelings()
    }
    
    private func setButtonBack() {
        buttonBack = ButtonBack(action: returnToJournal)
        view.addSubview(buttonBack)
        setButtonBackConstrains()
    }
    
    
    private func setButtonChevron() {
        buttonChevron.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        buttonChevron.isUserInteractionEnabled = false
        buttonChevron.tintColor = .fontColorNewJournalTitle
        
        view.addSubview(buttonChevron)
        
        setButtonChevronConstrains()
    }
    
    private func setTitleDate() {
        titleDate = TitleDateButton()
        
        view.addSubview(titleDate)
        
        buttonBack.translatesAutoresizingMaskIntoConstraints = false
        
        titleDate.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleDate.centerYAnchor.constraint(equalTo: titleNewJournal.topAnchor, constant: -20),
            titleDate.leadingAnchor.constraint(equalTo: buttonBack.trailingAnchor, constant: 8) // Espaço entre o botão e o texto da data
        ])
        
        //        titleDate.addTarget(self, action: #selector(datePickerTapped), for: .touchUpInside)
    }
    
    
    private func setDateLabel() -> Any {
        let dateFormatter = DateFormatter()
        
        //Estilo do dateFormatter
        dateFormatter.dateFormat = "dd 'de' MMM yyyy"
        
        // Obtenha a data atual
        let currentDate = Date()
        
        // Formatando a data atual com o estilo formatado
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate
        setTitleDateConstrains()
    }

    
    private func setButtonFeelings() {
        buttonModalFeelings = ButtonModalFeelings(action: closeKeyboardAndShowModal)
        view.addSubview(buttonModalFeelings)
        setButtonModalConstrains()
    }
    
    
    private func setModalFeeling() {
        view.addSubview(modalFeeling)

        
        setModalFeelingConstraints()
    }
    
    private func setButtonModel() {
        buttonModalFeelings.backgroundColor = .backgroundColorNewJournalButtonModalFeelings
        
        buttonModalFeelings = ButtonModalFeelings(action: closeKeyboardAndShowModal)
        
        view.addSubview(buttonModalFeelings)
        
        buttonModalFeelings.layer.cornerRadius = 30
        //        buttonFeeling.setImage(feeling, for: .normal)
        
        
        //        buttonFeeling.layoutMargins = .init(top: 10, left: 10, bottom: 10, right: 10)
        setButtonModalConstrains()
        
        //linha abaixo tirada por thiago
        //        buttonModalFeelings.addTarget(self, action: #selector(closeKeyboardAndShowModal), for: .touchUpInside)
        
        
    }
    
    /// Define a aparência da sombra do NewJounral.buttonModel no modo light do dispositivo.
    private func setButtonModelShadowLightMode() {
        buttonModalFeelings.layer.shadowRadius = 5 //Distância da shadow
        buttonModalFeelings.layer.shadowOpacity = 0.3
        buttonModalFeelings.layer.shadowColor = UIColor.black.cgColor
        buttonModalFeelings.layer.shadowOffset = CGSize(width: 0.0, height: 1.0) // Deslocamento vertical
    }
    
    /// Define a aparência da sombra do NewJounral.buttonModel no modo dark do dispositivo.
    private func setButtonModelShadowDarkMode() {
        
        buttonModalFeelings.layer.shadowRadius = 20 //Distância da shadow
        buttonModalFeelings.layer.shadowOpacity = 1
        buttonModalFeelings.layer.shadowColor = UIColor.black.cgColor
        buttonModalFeelings.layer.shadowOffset = CGSize(width: 0.0, height: 4.0) // Deslocamento vertical
    }
    
    
    
    //MARK: - FUNÇÕES LÓGICAS PARA FRONT-END
    
    private func setTapToHideKeyboard() {
        //TitleNewJournal
        let tapGestureTitleNewJournal = UITapGestureRecognizer(target: self, action: #selector(handleTapOutsideTitleJournal))
        tapGestureTitleNewJournal.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureTitleNewJournal)
        
        
        //BodyNewJournal
        let tapGestureBodyNewJournal = UITapGestureRecognizer(target: self, action: #selector(handleTapOutsideBodyKeyboard))
        tapGestureBodyNewJournal.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureBodyNewJournal)
    }
    
    ///Oculta a tabBar
    private func setTabBar() {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    ///Desoculta a tabBar
    private func disSetTabBar() {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    //TODO: Alinha bolinha ao retângulo
    //TODO: Colocar essa func no coordinator
    ///Retorna para view Journal
    @objc func returnToJournal() {
        disSetTabBar()
        HapticManager.shared.generateHapticFeedback(style: .heavy)
        navigationController?.popViewController(animated: true)
    }
    
    ///Função que abre o calendário da NewJournal, executada quando o TitleDate é tocado

    
    
    @objc func buttonModalFeelingAction() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            
            self.startMenuAnimation()
        }
        
        self.modalFeeling.isOpen.toggle()
    }
    
    func startMenuAnimation() {
        modalFeeling.isOpen ? closeModalFeelings() : openModalFeelings()
        modalFeeling.isOpen ? stackVerticalModalIsHidden() : stackVerticalModalIsNotHidden()
        view.layoutSubviews()
    }
    
    //AbreModal
    func openModalFeelings() {
        self.closeAnchorModalFeeling.isActive = false
        self.endModalFeelingAnchor.isActive = true
    }
    
    //FechaModal
    func closeModalFeelings() {
        self.endModalFeelingAnchor.isActive = false
        self.closeAnchorModalFeeling.isActive = true
    }
    
    //Deixa emogis visiveis
    func stackVerticalModalIsHidden() {
        self.modalFeeling.VStack.isHidden = true
    }
    
    //Deixa emogis invisiveis
    func stackVerticalModalIsNotHidden() {
        self.modalFeeling.VStack.isHidden = false
    }
    
    @objc func handleTapOutsideBodyKeyboard() {
        if bodyJournal.isFirstResponder {
            bodyJournal.resignFirstResponder()
        }
    }
    
    @objc func handleTapOutsideTitleJournal() {
        if titleNewJournal.isFirstResponder {
            titleNewJournal.resignFirstResponder()
        }
    }
    
    @objc func closeKeyboardAndShowModal() {
        if titleNewJournal.isFirstResponder {
            titleNewJournal.resignFirstResponder()
        }
        if bodyJournal.isFirstResponder {
            bodyJournal.resignFirstResponder()
        }
        
        //Função que chama a modal
        buttonModalFeelingAction()
    }
    
    //Func necessária para entrar em conformidade com DateModalDelegate
    func datePass(date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd 'de' MMM yyyy"
        let formattedDate = dateFormatter.string(from: date)
        
        // Atualiza o título do botão com a data formatada
        titleDate.setTitle(formattedDate, for: .normal)
        
        // Certifiqua de que o título do botão seja acessível para usuários com necessidades especiais
        titleDate.accessibilityLabel = formattedDate
    }
    
    //MARK: - CONSTRAINS
    
    private func setTitleJournalConstrains() {
        NSLayoutConstraint.activate([
            titleNewJournal.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
            titleNewJournal.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 23),
            //            titleNewJournal.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            titleNewJournal.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setBodyJournalConstrains() {
        NSLayoutConstraint.activate([
            bodyJournal.topAnchor.constraint(equalTo: titleNewJournal.bottomAnchor, constant: 20),
            bodyJournal.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bodyJournal.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 23),
            bodyJournal.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -23)
        ])
    }
    
    private func setDatePickerConstrains() {
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            datePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        ])
    }
    
    private func setButtonBackConstrains() {
        NSLayoutConstraint.activate([
            buttonBack.centerYAnchor.constraint(equalTo: titleNewJournal.topAnchor, constant: -20),
            buttonBack.leadingAnchor.constraint(equalTo: bodyJournal.leadingAnchor),
        ])
    }
    
    private func setTitleDateConstrains() {
        NSLayoutConstraint.activate([
            titleDate.centerYAnchor.constraint(equalTo: titleNewJournal.topAnchor, constant: -20),
            titleDate.leadingAnchor.constraint(equalTo: buttonBack.trailingAnchor, constant: 8) // Espaço entre o botão e o texto da data
        ])
    }
    
    private func setButtonChevronConstrains() {
        buttonChevron.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonChevron.centerYAnchor.constraint(equalTo: titleDate.centerYAnchor),
            buttonChevron.leadingAnchor.constraint(equalTo: titleDate.trailingAnchor, constant: 8), // Espaço entre titleDate e o botão
        ])
    }
    
    private func setButtonSaveConstrains() {
        NSLayoutConstraint.activate([
            buttonSave.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonSave.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        ])
    }
    
    private func setButtonModalFeelingConstrains() {
        modalFeeling.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            modalFeeling.bottomAnchor.constraint(equalTo: titleNewJournal.bottomAnchor),
            modalFeeling.leftAnchor.constraint(equalTo: titleNewJournal.leftAnchor, constant: 50),
            modalFeeling.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setModalFeelingConstraints() {
        NSLayoutConstraint.activate([
            closeAnchorModalFeeling,
            modalFeeling.topAnchor.constraint(equalTo: bodyJournal.topAnchor),
            modalFeeling.widthAnchor.constraint(equalToConstant: view.bounds.width / 1.3),
            //OBS: Comentar linha de código abaixo para deixar modal alinhada com body
            modalFeeling.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setButtonModalConstrains() {
        NSLayoutConstraint.activate([
            buttonModalFeelings.topAnchor.constraint(equalTo: datePicker.topAnchor),
            buttonModalFeelings.trailingAnchor.constraint(equalTo: bodyJournal.trailingAnchor),
            buttonModalFeelings.heightAnchor.constraint(equalToConstant: 60),
            buttonModalFeelings.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
    
}
