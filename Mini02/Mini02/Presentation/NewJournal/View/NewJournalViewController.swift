//
//  NewJournalViewController.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 26/09/23.
//

import UIKit

class NewJournalViewController: UIViewController, MVVMCView, dateModalDelegate {

    var modelView:NewJournalViewModel!
    
    var titleDate: TitleDateButton!
    let calendarPicker = CallendarPickerViewModal()
    let titleNewJournal = TitleNewJournal()
    let bodyJournal = PlaceholderTextView()
    let datePicker = UIDatePicker()
    
    var buttonSave: ButtonSave!
    var buttonModalFeelings = ButtonModalFeelings()
    var buttonBack = ButtonBack(action: nil)
    let buttonChevron = UIButton(type: .system)
        
    //MARK: MODAL
    var modalFeeling = ModalFeeling()
    let buttonModalFeeling = UIButton(type: .system)
    lazy var closeAnchorModalFeeling = modalFeeling.leadingAnchor.constraint(equalTo: view.trailingAnchor)
    lazy var endModalFeelingAnchor = modalFeeling.trailingAnchor.constraint(equalTo: buttonModalFeelings.trailingAnchor)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        modelView = NewJournalViewModel(viewController: self)
        setup()

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
        calendarPicker.delegate = self 
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
        view.addSubview(datePicker)
        setDatePickerConstrains()
        datePicker.isHidden = true
    }
    
    private func setNavigationController() {
        setButtonBack()
        setTitleDate()
        setButtonChevron()
    }
    
    private func setButtons() {
        setButtonSave()
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
        titleDate = TitleDateButton(action: openCalendar)
        view.addSubview(titleDate)
        setTitleDateConstrains()
    }
    
    private func setButtonSave() {
        buttonSave = ButtonSave(title: "Save", action: modelView.buttonSaveTapped)
        view.addSubview(buttonSave)
        setButtonSaveConstrains()
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
        navigationController?.popViewController(animated: true)
    }
    
    ///Função que abre o calendário da NewJournal, executada quando o TitleDate é tocado
    @objc func openCalendar() {
        let vc = CallendarPickerViewModal()
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .medium()]
        }
        vc.delegate = self
        vc.modalPresentationStyle = .automatic
        self.present(vc, animated: true, completion: nil)
    }
    
    
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
        buttonModalFeeling.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonModalFeeling.bottomAnchor.constraint(equalTo: titleNewJournal.bottomAnchor),
            buttonModalFeeling.leftAnchor.constraint(equalTo: titleNewJournal.leftAnchor, constant: 50),
            buttonModalFeeling.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setModalFeelingConstraints() {
        NSLayoutConstraint.activate([
            closeAnchorModalFeeling,
            modalFeeling.topAnchor.constraint(equalTo: bodyJournal.topAnchor),
            modalFeeling.widthAnchor.constraint(equalToConstant: view.bounds.width / 1.3),
//            modalFeeling.trailingAnchor.constraint(equalTo: view.trailingAnchor),
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

#Preview(traits: .defaultLayout, body: {
    NewJournalViewController()
})
