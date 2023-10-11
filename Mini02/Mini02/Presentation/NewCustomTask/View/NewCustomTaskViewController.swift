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
    
    // Variáveis para armazenar os dados do usuário
    var nomeDigitado: String?
    var nivelSelecionado: String?
    var descricaoDigitada: String?

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
    let pickerNivel: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.sizeToFit()
        return picker
    }()

    //PICKER A DIREITA
    let buttonPickerNivel: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Moderado", for: .normal)
        button.setTitleColor(.newCustomTaskBackgroundFont, for: .normal)
        if let image = UIImage(systemName: "chevron.up.chevron.down") {
            let coloredImage = image.withTintColor(.newCustomTaskBackgroundFont)
            button.setImage(coloredImage, for: .normal)
        }
        button.semanticContentAttribute = .forceRightToLeft
        
        button.addTarget(self, action: #selector(buttonPickerNivelTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - View Lifecycle
    // Dentro da função viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        
        setupNavigationBar()
        
        pickerNivel.delegate = self
        pickerNivel.dataSource = self
        
        setupUI()
        setGeralTapGestures()
        configureAccessibility()

    }

    private func setupNavigationBar() {
        navigationItem.title = "Nova tarefa"
        
        leftButton.addTarget(self, action: #selector(cancelar), for: .touchUpInside)
        
        rightButton.addTarget(self, action: #selector(adicionar), for: .touchUpInside)
        
        // Configurar os botões diretamente na barra de navegação
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    }



    private func setupUI() {
        view.backgroundColor = .newCustomTaskBackground

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
        view.addSubview(sectionBContainerView)
        sectionBContainerView.addSubview(nivelTextField)
        sectionBContainerView.addSubview(buttonPickerNivel)

        view.addSubview(pickerNivel)
        pickerNivel.isHidden = true

        setSectionBContainerViewConstraints()
        setNivelTextFieldConstraints()
        setNivelButtonConstraints()

        buttonPickerNivel.setTitle(niveis[0], for: .normal)

    }
    
    
    private func setGeralTapGestures() {
        //Adiciona gesto para fechar picker e keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        //Adiciona gesto para fechar picker
        let closePickerTap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        closePickerTap.cancelsTouchesInView = false
        view.addGestureRecognizer(closePickerTap)
        
        // Adicione um gesto de toque para ocultar o teclado
        let tapToDismissKeyboard = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        view.addGestureRecognizer(tapToDismissKeyboard)
    }

    // MARK: - Actions
    ///func executada ao clicar no button cancelar
    @objc func cancelar() {
        returnToHome()
    }

    /// Func executada ao clicar no botão Adicionar
    @objc func adicionar() {
        // Armazene os valores nas variáveis
        nomeDigitado = nomeTextField.text
        nivelSelecionado = buttonPickerNivel.title(for: .normal)
        descricaoDigitada = descricaoTextView.text

        // Exiba os valores (você pode substituir isso por qualquer lógica adicional)
        if let nome = nomeDigitado, let nivel = nivelSelecionado, let descricao = descricaoDigitada {
            print("Nome: \(nome)")
            print("Nível: \(nivel)")
            
            //Fiz essa gambiarra para não aparecer ser "Descrição" quando o usuário não digita nada.
            if descricao == descricaoTextView.placeholder {
                let textoDescricao = ""
                print("Descrição: \(textoDescricao)")
            }
            
        } else {
            print("Por favor, preencha todos os campos.")
        }
    }
    
    //MARK: - FUNÇÕES DE PICKER
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return niveis.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        buttonPickerNivel.setTitle(niveis[row], for: .normal)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
   
        return niveis[row]
    }
    
    //MARK: - FUNÇÕES DE OCULTAR E DESOCULTAR ELEMENTOS
    
    ///Abre o picker
    @objc func buttonPickerNivelTapped() {
        // Mostrar o UIPickerView quando o botão é tocado
        pickerNivel.isHidden = false
        nivelTextField.becomeFirstResponder()
    }
    
    /// Oculta o teclado
    @objc func dismissKeyboard(_ gesture: UITapGestureRecognizer) {
           view.endEditing(true) // Isso ocultará tanto o teclado quanto o UIPickerView
           pickerNivel.isHidden = true
       }

    ///Oculta o picker e outras coisas
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        // Obtenha a localização do toque
        let location = gesture.location(in: view)
        
        // Obtenha a altura da metade inferior da view
        let halfViewHeight = view.bounds.height / 2
        
        if nivelTextField.isFirstResponder && location.y > halfViewHeight {
            // Somente se o campo de texto estiver em foco e o toque estiver na metade inferior da view
            nivelTextField.resignFirstResponder()
            pickerNivel.isHidden = true
        }
    }

        
    //TODO: Colocar essa func no coordinator
    ///Retorna para home
    @objc func returnToHome() {
        navigationController?.popViewController(animated: true)
    }


    
    //MARK: - CONSTRAINS
    
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
              buttonPickerNivel.centerYAnchor.constraint(equalTo: sectionBContainerView.centerYAnchor),
              buttonPickerNivel.trailingAnchor.constraint(equalTo: sectionBContainerView.trailingAnchor, constant: -16)
          ])
          
          setPickerNivelConstrains()
      }
    
    private func setPickerNivelConstrains() {
        NSLayoutConstraint.activate([
//                  nivelPicker.topAnchor.constraint(equalTo: sectionBContainerView.bottomAnchor, constant: 20),
          pickerNivel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 16),

            pickerNivel.leadingAnchor.constraint(equalTo: sectionBContainerView.leadingAnchor, constant: 16),
            pickerNivel.trailingAnchor.constraint(equalTo: sectionBContainerView.trailingAnchor, constant: -16)
        ])

    }
    
    //MARK: - ACESSIBILITY
    
    private func configureAccessibility() {
        configureAccessibilityForTitleLabel()
        configureAccessibilityForLeftButton()
        configureAccessibilityForRightButton()
        configureAccessibilityForNomeTextField()
        configureAccessibilityForDescricaoTextView()
        configureAccessibilityForNivelTextField()
        configureAccessibilityForButtonPickerNivel()
    }

    private func configureAccessibilityForTitleLabel() {
        titleLabel.accessibilityLabel = "Título: Nova Tarefa"
    }

    private func configureAccessibilityForLeftButton() {
        leftButton.accessibilityLabel = "Botão Cancelar"
        leftButton.accessibilityHint = "Toque duas vezes para cancelar a tarefa."
    }

    private func configureAccessibilityForRightButton() {
        rightButton.accessibilityLabel = "Botão Adicionar"
        rightButton.accessibilityHint = "Toque duas vezes para adicionar a tarefa."
    }

    private func configureAccessibilityForNomeTextField() {
        nomeTextField.accessibilityLabel = "Campo de texto Nome"
        nomeTextField.accessibilityHint = "Toque duas vezes para digitar o nome da tarefa."
    }

    private func configureAccessibilityForDescricaoTextView() {
        descricaoTextView.accessibilityLabel = "Campo de texto Descrição"
        descricaoTextView.accessibilityHint = "Toque duas vezes para digitar a descrição da tarefa."
    }

    private func configureAccessibilityForNivelTextField() {
        nivelTextField.accessibilityLabel = "Nível"
    }

    private func configureAccessibilityForButtonPickerNivel() {
        buttonPickerNivel.accessibilityLabel = "Botão Nível"
        buttonPickerNivel.accessibilityHint = "Toque duas vezes para selecionar o nível da tarefa."
    }

}

#Preview(traits: .defaultLayout, body: {
    NewCustomTaskViewController()
})
