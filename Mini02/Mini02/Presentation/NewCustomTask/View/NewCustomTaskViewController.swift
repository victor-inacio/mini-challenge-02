//
//  NewCustomTaskViewController.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 09/10/23.
//

import UIKit

class NewCustomTaskViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    var viewModel: NewCustomTaskViewViewModel!
    
    let niveis = ["Iniciante", "Intermediário", "Avançado"]
    
    var picker: UIPickerView!
    
    // MARK: - UI Elements
    
    //MARK: ELEMENTOS DA BARRA DE NAVEGAÇÃO SIMULADA
    let customNavBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .newCustomTaskBackground // Cor da barra de navegação
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nova Tarefa"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold) // Estilo do título
        label.textColor = .newCustomTaskTitleNavigationBar // Cor do título
        return label
    }()

    let leftButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancelar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17) // Estilo do botão esquerdo
        button.setTitleColor(.newCustomTaskButtonColors, for: .normal)
        
        let higlightButtonColor = UIColor.newCustomTaskButtonColors.withAlphaComponent(0.6)
        button.setTitleColor(.newCustomTaskButtonColors, for: .normal)
        button.setTitleColor(higlightButtonColor, for: .highlighted)
        return button
    }()

    let rightButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Adicionar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold) // Estilo do botão direito
        let highlightButtonColor = UIColor.newCustomTaskButtonColors.withAlphaComponent(0.6)
        button.setTitleColor(.newCustomTaskButtonColors, for: .normal)
        button.setTitleColor(highlightButtonColor, for: .highlighted)

        return button
    }()

    
    //MARK: SECTION A
    let sectionAContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .newCustomTaskSectionBackground
        view.layer.cornerRadius = 12.0
        return view
    }()
    
    let nomeTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Nome"
        return textField
    }()
    
    let descricaoTextView: TextViewDescription = {
        let textView = TextViewDescription()
        return textView
    }()

    
    let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .newCustomTaskLine
        return view
    }()
    
    //MARK: SECTION A
    let sectionBContainerView: UIView = {
        let backgroundSectionB = UIView()
        backgroundSectionB.translatesAutoresizingMaskIntoConstraints = false
        backgroundSectionB.backgroundColor = .newCustomTaskSectionBackground
        backgroundSectionB.layer.cornerRadius = 12.0
        return backgroundSectionB
    }()
    
    let nivelTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Nível"
        return textField
    }()
    
    let nivelPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.sizeToFit()
        return picker
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // ... (código existente)
        
        // Adicione um gesto para fechar o UIPickerView quando tocar em qualquer lugar fora dele
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        
        
        setupNavigationBar()
        setupUI()
        self.navigationController?.navigationBar.isHidden = false
    }
    // MARK: - UI Setup
    private func setupNavigationBar() {
        navigationItem.title = "Nova tarefa" // Neste ponto, o título da barra de navegação é configurado corretamente

        nivelPicker.delegate = self
        nivelPicker.dataSource = self
        nivelTextField.inputView = nivelPicker

        // Adicione um gesto para fechar o UIPickerView quando tocar em qualquer lugar fora dele
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
         tapGesture.cancelsTouchesInView = false
         view.addGestureRecognizer(tapGesture)
         
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelar))
        
        let adicionarButton = UIBarButtonItem(title: "Adicionar", style: .done, target: self, action: #selector(adicionar))
        adicionarButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)], for: .normal)
        navigationItem.rightBarButtonItem = adicionarButton
    }
    
    private func setupUI() {
        view.backgroundColor = .newCustomTaskBackground
        
        nivelTextField.attributedPlaceholder = NSAttributedString(string: "Nível", attributes: [
            .foregroundColor: UIColor.newCustomTaskBackgroundFont,
        ])

        
        // Configuração da barra de navegação simulada
        view.addSubview(customNavBarView)
        customNavBarView.addSubview(titleLabel)
        customNavBarView.addSubview(leftButton)
        customNavBarView.addSubview(rightButton)

        let topConstraint: NSLayoutConstraint

        if #available(iOS 11.0, *) {
            topConstraint = customNavBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        } else {
            topConstraint = customNavBarView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor)
        }

        // Ajuste das posições
        NSLayoutConstraint.activate([
            topConstraint,
            customNavBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavBarView.heightAnchor.constraint(equalToConstant: 44), // Altura da barra de navegação

            titleLabel.centerXAnchor.constraint(equalTo: customNavBarView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: customNavBarView.centerYAnchor),

            leftButton.leadingAnchor.constraint(equalTo: customNavBarView.leadingAnchor, constant: 16), // Espaçamento esquerdo
            leftButton.centerYAnchor.constraint(equalTo: customNavBarView.centerYAnchor),

            rightButton.trailingAnchor.constraint(equalTo: customNavBarView.trailingAnchor, constant: -16), // Espaçamento direito
            rightButton.centerYAnchor.constraint(equalTo: customNavBarView.centerYAnchor)
        ])

        // Adicione ação aos botões
        leftButton.addTarget(self, action: #selector(cancelar), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(adicionar), for: .touchUpInside)
        
        // Section A
        view.addSubview(sectionAContainerView)
        sectionAContainerView.addSubview(nomeTextField)
        sectionAContainerView.addSubview(lineView)
        sectionAContainerView.addSubview(descricaoTextView)
//        sectionAContainerView.isUserInteractionEnabled = true
        
        // Section B
        view.addSubview(sectionBContainerView)
        sectionBContainerView.addSubview(nivelTextField)
        
        nivelTextField.inputView = nivelPicker
        
        let heightMultiplier: CGFloat = 138.0 / 193.0 // Aproximadamente 0.7150
        NSLayoutConstraint.activate([
            // Section A Constraints
            sectionAContainerView.topAnchor.constraint(equalTo: customNavBarView.bottomAnchor, constant: 16), // Começa abaixo da barra de navegação
            sectionAContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sectionAContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            sectionAContainerView.heightAnchor.constraint(equalToConstant: 193),

            nomeTextField.topAnchor.constraint(equalTo: sectionAContainerView.topAnchor, constant: 16),
            nomeTextField.leadingAnchor.constraint(equalTo: sectionAContainerView.leadingAnchor, constant: 16),
            nomeTextField.trailingAnchor.constraint(equalTo: sectionAContainerView.trailingAnchor, constant: -16),

            lineView.topAnchor.constraint(equalTo: nomeTextField.bottomAnchor, constant: 8),
            lineView.leadingAnchor.constraint(equalTo: sectionAContainerView.leadingAnchor, constant: 16),
            lineView.trailingAnchor.constraint(equalTo: sectionAContainerView.trailingAnchor, constant: -16),
            lineView.heightAnchor.constraint(equalToConstant: 1.0),

            descricaoTextView.topAnchor.constraint(equalTo: lineView.bottomAnchor),
            descricaoTextView.leadingAnchor.constraint(equalTo: sectionAContainerView.leadingAnchor, constant: 12),
            descricaoTextView.trailingAnchor.constraint(equalTo: sectionAContainerView.trailingAnchor, constant: -16),
            descricaoTextView.heightAnchor.constraint(equalTo: sectionAContainerView.heightAnchor, multiplier: heightMultiplier),
//            descricaoTextView.widthAnchor.constraint(equalTo: sectionAContainerView.widthAnchor, multiplier: 0.9),

            // Section B Constraints
            sectionBContainerView.topAnchor.constraint(equalTo: sectionAContainerView.bottomAnchor, constant: 16),
            sectionBContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sectionBContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            sectionBContainerView.heightAnchor.constraint(equalToConstant: 40),

            nivelTextField.topAnchor.constraint(equalTo: sectionBContainerView.topAnchor, constant: 10),
            nivelTextField.leadingAnchor.constraint(equalTo: sectionBContainerView.leadingAnchor, constant: 16),
            nivelTextField.trailingAnchor.constraint(equalTo: sectionBContainerView.trailingAnchor, constant: -16),
        ])
    }
    
    // MARK: - Actions
    @objc func cancelar() {
        print("Button cancel tapped")
    }
    
    @objc func adicionar() {
        print("Button add tapped")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return niveis.count
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        // Feche o UIPickerView quando tocar em qualquer lugar fora dele
        if nivelTextField.isFirstResponder {
            nivelTextField.resignFirstResponder()
        }
    }

//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        // Atualize o texto do nivelTextField com a seleção do UIPickerView
//        nivelTextField.text = niveis[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return niveis[row]
        
        // Imprima a escolha no terminal
        print("Escolha do usuário: \(niveis[row])")

    }

    
}

#Preview(traits: .defaultLayout, body: {
    NewCustomTaskViewController()
})
