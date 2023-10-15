//
//  CreateNewTaskViewController.swift
//  Mini02
//
//  Created by Luca Lacerda on 27/09/23.
//

import UIKit
import CoreHaptics

class CreateNewTaskViewController: UIViewController, MVVMCView, UITableViewDelegate, UITableViewDataSource, SecondaryTableViewCellDelegate {
    
    

    // MARK: - Propriedades
    var viewModel: CreateNewTaskViewModel! 
    var coordinator: CreateNewTaskCoordinator!
    var button = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.accessibilityLabel = "Botão Voltar"
        button.accessibilityHint = "Toque para voltar à tela anterior"
        return button
    }()
    
    var titleLabel = {
        let label = Label(localizedTextKey: "Escolha uma tarefa por nível de dificuldade", font: .big?.withSize(20))
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    var tableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .clear
        
        tableView.register(PrimaryTableViewCell.self, forCellReuseIdentifier: "PrimaryCell")
        tableView.register(SecondaryTableViewCell.self, forCellReuseIdentifier: "SecondaryCell")
        
        // Configure a tableView para adicionar espaçamento entre todas as células
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .light
        tableView.backgroundView = backgroundView
        
        return tableView
    }()
     
    let createTaskButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "button_fs"), for: .normal)
        button.accessibilityLabel = "Botão Criar nova tarefa"
        button.accessibilityHint = "Toque para criar nova tarefa"
        return button
    }()
    

    
    var isPrimaryCellExpanded = [true, false, false]
    var data: [DifficultyLevel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .light

        tabBarController?.tabBar.isHidden = true


        // MARK: Configuração da Interface do Usuário
       
        button.addTarget(self, action: #selector(returnToHome), for: .touchUpInside)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(button)
        self.view.addSubview(titleLabel)
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 80),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -5),
            
            titleLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        

        createTaskButton.addTarget(self, action: #selector(createNewTask), for: .touchUpInside)
        createTaskButton.titleLabel?.adjustsFontSizeToFitWidth = true

        viewModel.viewDidLoad()
        createTaskButton.layer.shadowColor = UIColor.black.cgColor
        createTaskButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        createTaskButton.layer.shadowRadius = 4
        createTaskButton.layer.shadowOpacity = 0.2

//        createTaskButton.titleLabel?.textAlignment = .justified

        bind()

        self.view.addSubview(createTaskButton)

        NSLayoutConstraint.activate([
//            createTaskButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            createTaskButton.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            createTaskButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.viewDidLoad()
    }
    
    private func bind() {
        viewModel.data.observeAndFire(on: self) { levels in
            self.data = levels
            
            self.tableView.reloadData()
        }
        viewModel.selected.observe(on: self) { levels in
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Botão de retorno
    
    @objc func returnToHome() {
        HapticManager.shared.generateHapticFeedback(style: .heavy)


        // Resto do código
        self.viewModel.coordinator.returnToParent()
        tabBarController?.tabBar.isHidden = false
    }

    
    // MARK: - Ação do Botão "Criar Nova Tarefa"
    
    @objc func createNewTask() {
//        modelView.activeSelectedTasks()
//        navigationController?.popViewController(animated: true)
        HapticManager.shared.generateHapticFeedback(style: .heavy)
        print("CLICADO")
        coordinator.goToNewCustomView()
    }
    
    // MARK: - TableView DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isPrimaryCellExpanded[section] {
            return data[section].getTasks().count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PrimaryCell", for: indexPath) as! PrimaryTableViewCell
            cell.textLabel?.text = data[indexPath.section].label
            cell.isExpanded = isPrimaryCellExpanded[indexPath.section]

            cell.selectionStyle = .none

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondaryCell", for: indexPath) as! SecondaryTableViewCell
            cell.label.text = data[indexPath.section].getTasks()[(indexPath.row - 1)].name
            cell.selectionStyle = .none
            cell.indexPath = indexPath

            
            cell.delegate = self
            cell.delegateB = self
            
            cell.isSelected = viewModel.selected.value.contains(where: { task in
                self.data[indexPath.section].getTasks()[(indexPath.row - 1)] == task
                
            })
            
            return cell 
        }
    }
    
    func onAddButtonTap(_ indexPath: IndexPath) {
        HapticManager.shared.generateHapticFeedback(style: .soft)

        let selected = data[indexPath.section].getTasks()[indexPath.row - 1]

        viewModel.activateTask(task: selected)
    }
    // MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
                   isPrimaryCellExpanded[indexPath.section].toggle()
                   tableView.reloadSections(IndexSet(integer: indexPath.section), with: .automatic)
                   
                   // Verifique se a célula está sendo expandida e aplique a sombra
                   if isPrimaryCellExpanded[indexPath.section] {
                       let cell = tableView.cellForRow(at: indexPath) as? PrimaryTableViewCell
                       cell?.addShadow()
                   } else {
                       let cell = tableView.cellForRow(at: indexPath) as? PrimaryTableViewCell
                       cell?.removeShadow()
                   }
               } else {
                   print("Clicked inside")
               }
           }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 88
        } else {
            return 120
        }
    }
    
    // MARK: - Espaçamento entre as Células
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
}

extension Set {
    subscript (index: Int) -> Element {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

extension CreateNewTaskViewController: SwipableTableCellDelegate {
    func onCollectionViewCellDeleted(_ collection: SwipableTableViewCell) {
        
    }
}



#Preview{
    CreateNewTaskViewController()
}
