//
//  NewCustomTaskViewController.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 09/10/23.
//

import UIKit

class NewCustomTaskViewController: UIViewController {
    
    var viewModel: NewCustomTaskViewViewModel!
    
    let niveis = ["Iniciante", "Intermediário", "Avançado"]
    
    // MARK: - UI Elements
    
    // Section A
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
    
    let descricaoTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Descrição"
        return textField
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .newCustomTaskLine
        return view
    }()
    
    // Section B
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
        return picker
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.viewModel = NewCustomTaskViewViewModel(viewController: self)
        setupNavigationBar()
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupNavigationBar() {
        navigationItem.title = "Nova tarefa"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelar))
        
        let adicionarButton = UIBarButtonItem(title: "Adicionar", style: .done, target: self, action: #selector(adicionar))
        adicionarButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)], for: .normal)
        navigationItem.rightBarButtonItem = adicionarButton
    }
    
    private func setupUI() {
        view.backgroundColor = .newCustomTaskBackground
        
        // Section A
        view.addSubview(sectionAContainerView)
        sectionAContainerView.addSubview(nomeTextField)
        sectionAContainerView.addSubview(lineView)
        sectionAContainerView.addSubview(descricaoTextField)
        
        // Section B
        view.addSubview(sectionBContainerView)
        sectionBContainerView.addSubview(nivelTextField)
        
        nivelTextField.inputView = nivelPicker
        
        NSLayoutConstraint.activate([
            // Section A Constraints
            sectionAContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
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

            descricaoTextField.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 8),
            descricaoTextField.leadingAnchor.constraint(equalTo: sectionAContainerView.leadingAnchor, constant: 16),
            descricaoTextField.trailingAnchor.constraint(equalTo: sectionAContainerView.trailingAnchor, constant: -16),

            // Section B Constraints
            sectionBContainerView.topAnchor.constraint(equalTo: sectionAContainerView.bottomAnchor, constant: 16),
            sectionBContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sectionBContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            sectionBContainerView.heightAnchor.constraint(equalToConstant: 36),

            nivelTextField.topAnchor.constraint(equalTo: sectionBContainerView.topAnchor, constant: 16),
            nivelTextField.leadingAnchor.constraint(equalTo: sectionBContainerView.leadingAnchor, constant: 16),
            nivelTextField.trailingAnchor.constraint(equalTo: sectionBContainerView.trailingAnchor, constant: -16),
        ])
    }
    
    // MARK: - Actions
    @objc func cancelar() {
        
    }
    
    @objc func adicionar() {
        
    }
    
}

#Preview(traits: .defaultLayout, body: {
    NewCustomTaskViewController()
})
