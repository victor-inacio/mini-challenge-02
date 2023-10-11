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

    //MARK: ELEMENTOS DA BARRA DE NAVEGAÇÃO SIMULADA
    let customNavBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .newCustomTaskBackground
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nova Tarefa"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .newCustomTaskTitleNavigationBar
        return label
    }()

    let leftButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancelar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
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
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
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

    //MARK: SECTION B
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

    let nivelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Moderado", for: .normal)
        button.setTitleColor(.newCustomTaskBackgroundFont, for: .normal)
        if let image = UIImage(systemName: "chevron.up.chevron.down") {
            let coloredImage = image.withTintColor(.newCustomTaskBackgroundFont)
            button.setImage(coloredImage, for: .normal)
        }
        button.semanticContentAttribute = .forceRightToLeft
        
        //Função que faz com que em qualquer lugar que seja clicado a na sectionB, seja aberto o picker de dificuldade.
        button.addTarget(NewCustomTaskViewController.self, action: #selector(nivelButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func nivelButtonTapped() {
        nivelPicker.isHidden = false
        nivelTextField.becomeFirstResponder()
    }

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    // MARK: - UI Setup
    private func setupNavigationBar() {
        navigationItem.title = "Nova tarefa"
        nivelPicker.delegate = self
        nivelPicker.dataSource = self
        nivelTextField.inputView = nivelPicker

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelar)
        )

        let adicionarButton = UIBarButtonItem(title: "Adicionar", style: .done, target: self, action: #selector(adicionar))
        adicionarButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)], for: .normal)
        navigationItem.rightBarButtonItem = adicionarButton
    }

    private func setupUI() {
        view.backgroundColor = .newCustomTaskBackground
        nivelTextField.attributedPlaceholder = NSAttributedString(string: "Nível", attributes: [
            .foregroundColor: UIColor.newCustomTaskBackgroundFont,
        ])

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

        NSLayoutConstraint.activate([
            topConstraint,
            customNavBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavBarView.heightAnchor.constraint(equalToConstant: 44),

            titleLabel.centerXAnchor.constraint(equalTo: customNavBarView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: customNavBarView.centerYAnchor),

            leftButton.leadingAnchor.constraint(equalTo: customNavBarView.leadingAnchor, constant: 16),
            leftButton.centerYAnchor.constraint(equalTo: customNavBarView.centerYAnchor),

            rightButton.trailingAnchor.constraint(equalTo: customNavBarView.trailingAnchor, constant: -16),
            rightButton.centerYAnchor.constraint(equalTo: customNavBarView.centerYAnchor)
        ])

        leftButton.addTarget(self, action: #selector(cancelar), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(adicionar), for: .touchUpInside)

        view.addSubview(sectionAContainerView)
        sectionAContainerView.addSubview(nomeTextField)
        sectionAContainerView.addSubview(lineView)
        sectionAContainerView.addSubview(descricaoTextView)

        view.addSubview(sectionBContainerView)
        sectionBContainerView.addSubview(nivelTextField)
        sectionBContainerView.addSubview(nivelButton)
        nivelTextField.inputView = nivelPicker

        let heightMultiplier: CGFloat = 138.0 / 193.0
        NSLayoutConstraint.activate([
            sectionAContainerView.topAnchor.constraint(equalTo: customNavBarView.bottomAnchor, constant: 16),
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

            sectionBContainerView.topAnchor.constraint(equalTo: sectionAContainerView.bottomAnchor, constant: 16),
            sectionBContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sectionBContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            sectionBContainerView.heightAnchor.constraint(equalToConstant: 40),

            nivelTextField.topAnchor.constraint(equalTo: sectionBContainerView.topAnchor, constant: 10),
            nivelTextField.leadingAnchor.constraint(equalTo: sectionBContainerView.leadingAnchor, constant: 16),
            nivelTextField.trailingAnchor.constraint(equalTo: sectionBContainerView.trailingAnchor, constant: -16),

            nivelButton.centerYAnchor.constraint(equalTo: sectionBContainerView.centerYAnchor),
            nivelButton.trailingAnchor.constraint(equalTo: sectionBContainerView.trailingAnchor, constant: -16),
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
        print("func handleTap() 1️⃣")
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print("func pickerView() 🔢")
        return niveis.count
    }

    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        if nivelTextField.isFirstResponder {
            nivelTextField.resignFirstResponder()
        }
        print("func handleTap()")
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return niveis[row]
        print("func pickerView()")
        print("Escolha do usuário: \(niveis[row])")
    }
}

#Preview(traits: .defaultLayout, body: {
    NewCustomTaskViewController()
})
