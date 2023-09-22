//
//  ViewController.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

// HomeViewController.swift
import UIKit

class HomeViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground


        
        // Cria o cabeçalho com o título e o botão
        let headerView = HeaderView()
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
    }
    
    @objc func buttonTapped() {
        // Ação do botão
        print("Botão foi tocado.")
    }
}


#Preview{
    HomeViewController()
}
