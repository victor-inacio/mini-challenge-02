//
//  CreateNewTaskViewController.swift
//  Mini02
//
//  Created by Luca Lacerda on 27/09/23.
//

import UIKit

class CreateNewTaskViewController: UIViewController, MVVMCView, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Propriedades
    
    var modelView: CreateNewTaskViewModel!
    var coordinator: CreateNewTaskCoordinator!
    var button = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
       
        
        return button
    }()
    var titleLabel = {
        let label = Label(text: "Escolha uma tarefa por nível de dificuldade", font: .big?.withSize(20))
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
    
    var isPrimaryCellExpanded = [false, false, false]
    
    let primaryCellData = ["Nível Iniciante", "Nível Intermediário", "Nível Avançado"]
    
    let secondaryCellData = [["Tarefa 1", "Tarefa 2", "Tarefa 3"],
                             ["Tarefa 4", "Tarefa 5", "Tarefa 6"],
                             ["Tarefa 7", "Tarefa 8", "Tarefa 9"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .light


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
        
        // Adicione o botão "Criar Nova Tarefa" abaixo da tableView
        let criarTarefaButton = UIButton()
        criarTarefaButton.translatesAutoresizingMaskIntoConstraints = false
        criarTarefaButton.backgroundColor = .createButton
        criarTarefaButton.setTitle("Criar Nova Tarefa", for: .normal)
        criarTarefaButton.setTitleColor(.createButtonText, for: .normal)
        criarTarefaButton.titleLabel?.font = UIFont(name: "Nunito-Bold", size: 23)
        criarTarefaButton.addTarget(self, action: #selector(criarNovaTarefa), for: .touchUpInside)
        criarTarefaButton.layer.cornerRadius = 20
        
        // Adicione sombra às bordas
        criarTarefaButton.layer.shadowColor = UIColor.black.cgColor
        criarTarefaButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        criarTarefaButton.layer.shadowRadius = 4
        criarTarefaButton.layer.shadowOpacity = 0.3
        
        self.view.addSubview(criarTarefaButton)
        
        NSLayoutConstraint.activate([
            criarTarefaButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            criarTarefaButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
            criarTarefaButton.heightAnchor.constraint(equalToConstant: 50),
            criarTarefaButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    // MARK: - Botão de retorno
    
    @objc func returnToHome() {
        self.modelView.coordinator.returnToParent()
    }
    
    // MARK: - Ação do Botão "Criar Nova Tarefa"
    
    @objc func criarNovaTarefa() {
        // Adicione o código para criar uma nova tarefa aqui
    }
    
    // MARK: - TableView DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return primaryCellData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isPrimaryCellExpanded[section] {
            return secondaryCellData[section].count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PrimaryCell", for: indexPath) as! PrimaryTableViewCell
            cell.textLabel?.text = primaryCellData[indexPath.section]
            cell.isExpanded = isPrimaryCellExpanded[indexPath.section]
            cell.selectionStyle = .none

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondaryCell", for: indexPath) as! SecondaryTableViewCell
            cell.textLabel?.text = secondaryCellData[indexPath.section][indexPath.row - 1]
            cell.selectionStyle = .none

            return cell
        }
    }
    
    // MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            isPrimaryCellExpanded[indexPath.section].toggle()
            tableView.reloadSections(IndexSet(integer: indexPath.section), with: .automatic)
        } else {
            // Lógica para lidar com a seleção de células secundárias
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



#Preview{
    CreateNewTaskViewController()
}
