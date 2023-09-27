//
//  NewJournalViewController.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 26/09/23.
//

import UIKit

class NewJournalViewController: UIViewController {
    
    var vm:NewJournalViewModel!
    
    let textField = UITextField()
    let textView = UITextView()
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
        setButtonSave()
//        let placeholder = TextView(placeholder: "Trabalhe muito")
//
//        view.addSubview(placeholder)
//        
//        
//        NSLayoutConstraint.activate([
//            placeholder.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
//            placeholder.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            placeholder.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
//            placeholder.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
//        ])
    }
    
    ///Seta configurações do textField
    private func setTextField() {
        
        view.addSubview(textField)
                
        //MARK: PLACEHOLDER
        let placeholder = UILabel()
        placeholder.text = "Title" //String do placeholder
        placeholder.font = .systemFont(ofSize: 50) //Tamanho da fonte
        textField.placeholder =  placeholder.text
        
        //MARK: FONT
        if let font = UIFont(name: "Helvetica-Bold", size: 32) {
            textField.font = font
        }
        
        //MARK: LAYOUT
        textField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    textField.layer.cornerRadius = 15 //Define radius da borda
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: 40)) //Determina tamanho para adicioner ícones.
//        textField.leftViewMode = .always //Define quando o leftViewMode funcionará
//        textField.font = UIFont.preferredFont(forTextStyle: .largeTitle) //Define o estilo de fonte.

        
    }
    
    ///Seta configurações da textView
    private func setTextView() {
        //MARK: BASICS CONFIGS
        textView.textContainerInset = UIEdgeInsets(top: 26, left: 17, bottom: 10, right: 10) //Define a distância do conteúdo que o usuário digita na textView para a borda da textView.
        textView.isScrollEnabled = true //Habilita o Scroll na textView.
        textView.clipsToBounds = false //Necessário ser false para as sombras funcionarem.
        textView.layer.cornerRadius = 15
        
        textView.font = UIFont.systemFont(ofSize: 16)
        
        //MARK: SHADOW
        textView.layer.shadowOffset = CGSize(width: 2, height: 2) //Tamanho da shadow
        textView.layer.shadowRadius = 4 //Distância da shadow
        textView.layer.shadowOpacity = 0.3
        textView.layer.shadowColor = UIColor.black.cgColor
                
        view.addSubview(textView)
        
        //MARK: LAYOUT
        textView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
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


class TextView: UITextView, UITextViewDelegate {

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
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (placeholderOn) {
            removePlaceholder()
        }
    }

    // Delegado chamado quando a edição do texto termina
    func textViewDidEndEditing(_ textView: UITextView) {
        if (text == "") {
            placePlaceholder()
        }
    }
}

