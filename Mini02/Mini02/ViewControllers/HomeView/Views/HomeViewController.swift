//
//  ViewController.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

// HomeViewController.swift
import UIKit

class HomeViewController: UIViewController {
    
    var headerView = HeaderView()
    var weekView = WeekView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground

        //Criando WeekView
        view.addSubview(weekView.stackView)
        setupConstrainsWeek()
        
        // Cria o cabeçalho com o título e o botão
//        setHeaderView()
        
        
    }
    
    @objc func buttonTapped() {
        // Ação do botão
        print("Botão foi tocado.")
    }
    
    func setHeaderView() {
        headerView.titleLabel.text = "Suas Tarefas"
        
        headerView.actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(headerView)
        
        // Configura as constraints para o cabeçalho
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 250), // Altura do cabeçalho
        ])

    }

    
    ///Define as constrains da WeekView
    func setupConstrainsWeek() {
        
        // Define as restrições da contentStackView para preencher a WeekView
        weekView.stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weekView.stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            weekView.stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weekView.stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            // NOTE: - O código abaixo talvez seja usado no futuro para definir uma constrain entre o bottomAnchor e o topAnchor de weekView e heraderView.
            //contentStackView.bottomAnchor.constraint(equalTo: headerView.topAnchor)
        ])
    }
    
}


#Preview{
    HomeViewController()
}

