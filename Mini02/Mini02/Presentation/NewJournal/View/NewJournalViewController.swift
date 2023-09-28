//
//  NewJournalViewController.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 26/09/23.
//

import UIKit

class NewJournalViewController: UIViewController {
    
    var vm:NewJournalViewModel!
    
    let titleJournal = UITextField()
    let bodyTextJournal = UITextView()
    let datePicker = UIDatePicker()
    let saveButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        vm = NewJournalViewModel(view: self)
        setup()
    }
    
    private func setup() {
        setDatePicker()
        setTextField()
        setTextView()
//        setButtonSave()
        
        let placeholder = Mini02.bodyTextJournal(placeholder: "Como foi o seu dia?\nVocê sente que conseguiu evoluir?\nSe não, qual impedimento você encontrou?")

        view.addSubview(placeholder)
        
        
        NSLayoutConstraint.activate([
            placeholder.topAnchor.constraint(equalTo: titleJournal.bottomAnchor, constant: 20),
            placeholder.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            placeholder.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            placeholder.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
    
    ///Seta configurações do titleJournal
    private func setTextField() {
        
        view.addSubview(titleJournal)
                
        //MARK: PLACEHOLDER
        let placeholder = UILabel()
        placeholder.text = "Title" //String do placeholder
        placeholder.font = .systemFont(ofSize: 50) //Tamanho da fonte
        titleJournal.placeholder =  placeholder.text
        
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
    
    ///Seta configurações da bodyTextJournal
    private func setTextView() {
        //MARK: BASICS CONFIGS
        bodyTextJournal.textContainerInset = UIEdgeInsets(top: 26, left: 17, bottom: 10, right: 10) //Define a distância do conteúdo que o usuário digita na bodyTextJournal para a borda da bodyTextJournal.
        bodyTextJournal.isScrollEnabled = true //Habilita o Scroll na bodyTextJournal.
        bodyTextJournal.clipsToBounds = false //Necessário ser false para as sombras funcionarem.
        bodyTextJournal.layer.cornerRadius = 15
        
        bodyTextJournal.font = UIFont.systemFont(ofSize: 16)
        
        //MARK: SHADOW
        bodyTextJournal.layer.shadowOffset = CGSize(width: 2, height: 2) //Tamanho da shadow
        bodyTextJournal.layer.shadowRadius = 4 //Distância da shadow
        bodyTextJournal.layer.shadowOpacity = 0.3
        bodyTextJournal.layer.shadowColor = UIColor.black.cgColor
                
        view.addSubview(bodyTextJournal)
        
        //MARK: LAYOUT
        bodyTextJournal.translatesAutoresizingMaskIntoConstraints = false

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


class bodyTextJournal: UITextView, UITextViewDelegate {

    // Variável para controlar se o placeholder está ativo
    var placeholderOn = true
    var placeholder: String!

    // Inicializador personalizado que aceita um placeholder
    init(placeholder: String) {
        super.init(frame: .init(x: 0, y: 0, width: 100, height: 100), textContainer: nil)

        translatesAutoresizingMaskIntoConstraints = false

        self.placeholder = placeholder
        layer.cornerRadius = 28
        textContainerInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        
        backgroundColor = .white

        // Coloca o placeholder inicialmente
        placePlaceholder()
        delegate = self
    }

    // Função para colocar o placeholder
    func placePlaceholder() {
        placeholderOn = true
        text = placeholder
    }

    // Função para remover o placeholder quando o usuário começa a digitar
    func removePlaceholder() {
        placeholderOn = false
        text = ""
    }

    // Inicializador necessário ao usar a classe em Interface Builder (Storyboard ou xib)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // Delegado chamado quando a edição do texto começa
    func textViewDidBeginEditing(_ bodyTextJournal: UITextView) {
        if (placeholderOn) {
            removePlaceholder()
        }
    }

    // Delegado chamado quando a edição do texto termina
    func textViewDidEndEditing(_ bodyTextJournal: UITextView) {
        if (text == "") {
            placePlaceholder()
        }
    }
}

