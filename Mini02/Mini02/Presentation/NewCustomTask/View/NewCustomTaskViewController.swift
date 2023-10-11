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

    //Label que esta escrito level
    let nivelTextField: UILabel = {
        let textField = UILabel()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "Nível"
        textField.backgroundColor = .newCustomTaskSectionBackground
        return textField
    }()

    //LITERALMENTE O PICKER
    let nivelPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.sizeToFit()
        return picker
    }()

    //PICKER A DIREITA
    let nivelButtonPicker: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Moderado", for: .normal)
        button.setTitleColor(.newCustomTaskBackgroundFont, for: .normal)
        if let image = UIImage(systemName: "chevron.up.chevron.down") {
            let coloredImage = image.withTintColor(.newCustomTaskBackgroundFont)
            button.setImage(coloredImage, for: .normal)
        }
        button.semanticContentAttribute = .forceRightToLeft
        
        //Função que faz com que em qualquer lugar que seja clicado a na sectionB, seja aberto o picker de dificuldade.
        button.addTarget(self, action: #selector(nivelButtonPickerTappedText), for: .touchUpInside)
        return button
    }()

//    @objc func nivelButtonTapped() {
//        nivelPicker.isHidden = false
//        nivelTextField.becomeFirstResponder()
//    }
    
    @objc func nivelButtonPickerTappedText() {
        // Mostrar o UIPickerView quando o botão é tocado
        nivelPicker.isHidden = false
        nivelTextField.becomeFirstResponder()
    }


    // MARK: - View Lifecycle
    // Dentro da função viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
        
        let closePickerTap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        closePickerTap.cancelsTouchesInView = false
        view.addGestureRecognizer(closePickerTap)
        
        // Adicione um gesto de toque para ocultar o teclado
        let tapToDismissKeyboard = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        view.addGestureRecognizer(tapToDismissKeyboard)
    }
    // Função para ocultar o teclado
    @objc func dismissKeyboard(_ gesture: UITapGestureRecognizer) {
           view.endEditing(true) // Isso ocultará tanto o teclado quanto o UIPickerView
           nivelPicker.isHidden = true
       }

    // MARK: - UI Setup
    private func setupNavigationBar() {
        navigationItem.title = "Nova tarefa"
        nivelPicker.delegate = self
        nivelPicker.dataSource = self
//        nivelTextField.inputView = nivelPicker

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        setButtonsActions()

    }
    
    private func setButtonsActions() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelar)
        )

        let leftButton = UIBarButtonItem(title: "Adicionar", style: .done, target: self, action: #selector(adicionar))
        leftButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)], for: .normal)
        
        navigationItem.rightBarButtonItem = leftButton
    }

    private func setupUI() {
        view.backgroundColor = .newCustomTaskBackground

//        nivelTextField.attributedPlaceholder = NSAttributedString(string: "Nível", attributes: [
//            .foregroundColor: UIColor.newCustomTaskBackgroundFont,
//        ])

        // Configuração da barra de navegação simulada
        view.addSubview(customNavBarView)
        customNavBarView.addSubview(titleLabel)
        customNavBarView.addSubview(leftButton)
        customNavBarView.addSubview(rightButton)

        setCustomNavBarViewConstraints()
        setTitleLabelConstraints()
        setLeftButtonConstraints()
        setRightButtonConstraints()

        // Section A
        view.addSubview(sectionAContainerView)
        sectionAContainerView.addSubview(nomeTextField)
        sectionAContainerView.addSubview(lineView)
        sectionAContainerView.addSubview(descricaoTextView)

        setSectionAContainerViewConstraints()
        setNomeTextFieldConstraints()
        setLineViewConstraints()
        setDescricaoTextViewConstraints()

        // Section B
        // Seção B
        view.addSubview(sectionBContainerView)
        sectionBContainerView.addSubview(nivelTextField)
        sectionBContainerView.addSubview(nivelButtonPicker) // Adicione o botão

        // Adicione o UIPickerView diretamente à vista principal
        view.addSubview(nivelPicker)
        nivelPicker.isHidden = true

        setSectionBContainerViewConstraints()
        setNivelTextFieldConstraints()
        setNivelButtonConstraints()

//        nivelTextField.inputView = nivelPicker
        nivelButtonPicker.setTitle(niveis[0], for: .normal)

    }

    // MARK: - Actions
    @objc func cancelar() {
        print("Button cancel tapped")
    }

    @objc func adicionar() {
        print("Button add tapped")
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nivelButtonPicker.setTitle(niveis[row], for: .normal)
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
        nivelPicker.isHidden = true

        print("func handleTap()")
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("func pickerView()")
        print("Escolha do usuário: \(niveis[row])")
        return niveis[row]
    }
    
    //MARK: CONSTRAINS
    
    private func setCustomNavBarViewConstraints() {
          NSLayoutConstraint.activate([
              customNavBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
              customNavBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
              customNavBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
              customNavBarView.heightAnchor.constraint(equalToConstant: 44)
          ])
      }
      
      private func setTitleLabelConstraints() {
          NSLayoutConstraint.activate([
              titleLabel.centerXAnchor.constraint(equalTo: customNavBarView.centerXAnchor),
              titleLabel.centerYAnchor.constraint(equalTo: customNavBarView.centerYAnchor)
          ])
      }
      
      private func setLeftButtonConstraints() {
          NSLayoutConstraint.activate([
              leftButton.leadingAnchor.constraint(equalTo: customNavBarView.leadingAnchor, constant: 16),
              leftButton.centerYAnchor.constraint(equalTo: customNavBarView.centerYAnchor)
          ])
      }
      
      private func setRightButtonConstraints() {
          NSLayoutConstraint.activate([
              rightButton.trailingAnchor.constraint(equalTo: customNavBarView.trailingAnchor, constant: -16),
              rightButton.centerYAnchor.constraint(equalTo: customNavBarView.centerYAnchor)
          ])
      }
      
      private func setSectionAContainerViewConstraints() {
          NSLayoutConstraint.activate([
              sectionAContainerView.topAnchor.constraint(equalTo: customNavBarView.bottomAnchor, constant: 16),
              sectionAContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
              sectionAContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
              sectionAContainerView.heightAnchor.constraint(equalToConstant: 193)
          ])
      }
      
      private func setNomeTextFieldConstraints() {
          NSLayoutConstraint.activate([
              nomeTextField.topAnchor.constraint(equalTo: sectionAContainerView.topAnchor, constant: 16),
              nomeTextField.leadingAnchor.constraint(equalTo: sectionAContainerView.leadingAnchor, constant: 16),
              nomeTextField.trailingAnchor.constraint(equalTo: sectionAContainerView.trailingAnchor, constant: -16)
          ])
      }
      
      private func setLineViewConstraints() {
          NSLayoutConstraint.activate([
              lineView.topAnchor.constraint(equalTo: nomeTextField.bottomAnchor, constant: 8),
              lineView.leadingAnchor.constraint(equalTo: sectionAContainerView.leadingAnchor, constant: 16),
              lineView.trailingAnchor.constraint(equalTo: sectionAContainerView.trailingAnchor, constant: -16),
              lineView.heightAnchor.constraint(equalToConstant: 1.0)
          ])
      }
      
      private func setDescricaoTextViewConstraints() {
          let heightMultiplier: CGFloat = 138.0 / 193.0
          NSLayoutConstraint.activate([
              descricaoTextView.topAnchor.constraint(equalTo: lineView.bottomAnchor),
              descricaoTextView.leadingAnchor.constraint(equalTo: sectionAContainerView.leadingAnchor, constant: 12),
              descricaoTextView.trailingAnchor.constraint(equalTo: sectionAContainerView.trailingAnchor, constant: -16),
              descricaoTextView.heightAnchor.constraint(equalTo: sectionAContainerView.heightAnchor, multiplier: heightMultiplier)
          ])
      }
      
      private func setSectionBContainerViewConstraints() {
          NSLayoutConstraint.activate([
              sectionBContainerView.topAnchor.constraint(equalTo: sectionAContainerView.bottomAnchor, constant: 16),
              sectionBContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
              sectionBContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
              sectionBContainerView.heightAnchor.constraint(equalToConstant: 40)
          ])
      }
      
      private func setNivelTextFieldConstraints() {
          NSLayoutConstraint.activate([
              nivelTextField.topAnchor.constraint(equalTo: sectionBContainerView.topAnchor, constant: 10),
              nivelTextField.leadingAnchor.constraint(equalTo: sectionBContainerView.leadingAnchor, constant: 16),
              nivelTextField.trailingAnchor.constraint(equalTo: sectionBContainerView.trailingAnchor, constant: -16)
          ])
      }
      
      private func setNivelButtonConstraints() {
          NSLayoutConstraint.activate([
              nivelButtonPicker.centerYAnchor.constraint(equalTo: sectionBContainerView.centerYAnchor),
              nivelButtonPicker.trailingAnchor.constraint(equalTo: sectionBContainerView.trailingAnchor, constant: -16)
          ])
          
              NSLayoutConstraint.activate([
//                  nivelPicker.topAnchor.constraint(equalTo: sectionBContainerView.bottomAnchor, constant: 20),
                nivelPicker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 16),

                  nivelPicker.leadingAnchor.constraint(equalTo: sectionBContainerView.leadingAnchor, constant: 16),
                  nivelPicker.trailingAnchor.constraint(equalTo: sectionBContainerView.trailingAnchor, constant: -16)
              ])

      }
}

#Preview(traits: .defaultLayout, body: {
    NewCustomTaskViewController()
})
