//
//  ViewController.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var modelView: HomeViewModel! 
    let headerView = HeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        // Cria o cabeçalho com o título e o botão
        headerView.titleLabel.text = "Suas Tarefas"
        
        headerView.actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(headerView)
        
        // Configura as constraints para o cabeçalho
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 44), // Altura do cabeçalho
        ])
        
        let tasks = modelView.getTasks()
        
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10
        
        for task in tasks {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(task, for: .normal)
            button.backgroundColor = .yellow
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 8
            stack.addArrangedSubview(button)
        }
        
        self.view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    @objc func buttonTapped() {
        // Ação do botão
        print("Botão foi tocado.")
    }
}

//#Preview {
//    HomeViewController()
//}
