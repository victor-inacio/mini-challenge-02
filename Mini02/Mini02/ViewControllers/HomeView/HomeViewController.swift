//
//  ViewController.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

// HomeViewController.swift
import UIKit

class HomeViewController: UIViewController, HasHeaderView {
    
    var headerView = HeaderView()
//    
//    var contentStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.distribution = .equalSpacing
//        stackView.alignment = .fill
//        stackView.spacing = 0
//        stackView.axis = .horizontal
//        return stackView
//    }()
    
    var weekView = WeekView()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground

        //Cria o calendário semanal
//        setupView()
//        setupConstrains()
        
        view.addSubview(weekView.contentStackView)
        setupConstrainsWeek()
        
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
            headerView.heightAnchor.constraint(equalToConstant: 250), // Altura do cabeçalho
        ])

    }
//    
//    /// Adiciona os elementos dentro da stackView
//    func setupView() {
//        
//        view.addSubview(contentStackView)
//        
//        let days:[String] = ["dom", "seg", "ter", "qua", "quin", "sex", "sab"]
//        
//        for i in 1...7 {
//            let labelDate = UILabel()
//            labelDate.text = "10/11"
//            
//            let labelDayOfWeek = UILabel()
//            labelDayOfWeek.text = days[i - 1]
//            
//            labelDate.font = .systemFont(ofSize: 10)
//            labelDayOfWeek.font = .systemFont(ofSize: 10)
//
//            
//            let dayWeek = DayWeekView(circle: DayCircle(), labelDate: labelDate, labelDayOfWeek: labelDayOfWeek)
//            
//            contentStackView.addArrangedSubview(dayWeek)
//        }
//    }
//    
//    func setupConstrains() {
//        
//        // Define as restrições da contentStackView para preencher a WeekView
//        contentStackView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
//            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
////            contentStackView.bottomAnchor.constraint(equalTo: headerView.topAnchor)
//        ])
//    }
    
    func setupConstrainsWeek() {
        
        // Define as restrições da contentStackView para preencher a WeekView
        weekView.contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weekView.contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            weekView.contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weekView.contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            contentStackView.bottomAnchor.constraint(equalTo: headerView.topAnchor)
        ])
    }

}


#Preview{
    HomeViewController()
}

