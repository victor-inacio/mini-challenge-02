//
//  ViewController.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

// HomeViewController.swift
import UIKit

class HomeViewController: UIViewController {
    
    let headerView = HeaderView()
    
    var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.axis = .horizontal
        return stackView
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground

        //Cria o calendário semanal
        setupView()
        setupConstrains()
        
        // Cria o cabeçalho com o título e o botão
        setHeaderView()
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
            headerView.heightAnchor.constraint(equalToConstant: 200), // Altura do cabeçalho
        ])

    }
    
    /// Adiciona os elementos dentro da stackView
    func setupView() {
        
        var label1 = UILabel()
        label1.text = "10/11"
        label1.font = .systemFont(ofSize: 10)
//        label1.backgroundColor = UIColor.blue
        contentStackView.addArrangedSubview(label1)
        
        var label2 = UILabel()
        label2.text = "10/11"
        label2.font = .systemFont(ofSize: 10)
//        label2.backgroundColor = UIColor.blue
        contentStackView.addArrangedSubview(label2)
        
        var label3 = UILabel()
        label3.text = "10/11"
        label3.font = .systemFont(ofSize: 10)
//        label3.backgroundColor = UIColor.blue
        contentStackView.addArrangedSubview(label3)
        
        var label4 = UILabel()
        label4.text = "10/11"
        label4.font = .systemFont(ofSize: 10)
//        label4.backgroundColor = UIColor.blue
        contentStackView.addArrangedSubview(label4)
        
        var label5 = UILabel()
        label5.text = "10/11"
        label5.font = .systemFont(ofSize: 10)
//        label5.backgroundColor = UIColor.blue
        contentStackView.addArrangedSubview(label5)
        
        var label6 = UILabel()
        label6.text = "10/11"
        label6.font = .systemFont(ofSize: 10)
//        label6.backgroundColor = UIColor.blue
        contentStackView.addArrangedSubview(label6)
        
        var label7 = UILabel()
        label7.text = "10/11"
        label7.font = .systemFont(ofSize: 10)
//        label7.backgroundColor = UIColor.blue
        contentStackView.addArrangedSubview(label7)
        
        view.addSubview(contentStackView)
        
    }
    
    func setupConstrains() {
//        backgroundColor = .white
        
        // Define as restrições da contentStackView para preencher a WeekView
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            contentStackView.bottomAnchor.constraint(equalTo: headerView.topAnchor)
        ])
    }
}


#Preview{
    HomeViewController()
}

