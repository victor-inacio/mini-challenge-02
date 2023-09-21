//
//  StatisticView.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

import UIKit

class StatisticViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // Cria o primeiro título
        let titleLabel1 = UILabel()
        titleLabel1.text = "Estatísticas"
        titleLabel1.font = UIFont.boldSystemFont(ofSize: 40)
        titleLabel1.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(titleLabel1)
        
        // Cria o segundo título
        let titleLabel2 = UILabel()
        titleLabel2.text = "Informações Gerais"
        titleLabel2.font = UIFont.systemFont(ofSize: 18)
        titleLabel2.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(titleLabel2)
        
        // Cria uma instância de StatisticsBoxView para exibir as estatísticas
        let statisticsBox = StatisticsBoxView()
        statisticsBox.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(statisticsBox)
        
        // Configura as constraints para posicionar os títulos e a box de estatísticas
        NSLayoutConstraint.activate([
            // Constraints para o primeiro título (Título Maior)
            titleLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            // Constraints para o segundo título (Informações Gerais)
            titleLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel2.topAnchor.constraint(equalTo: titleLabel1.bottomAnchor, constant: 10),
            
            // Constraints para a box de estatísticas
            statisticsBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statisticsBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            statisticsBox.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor, constant: 10),
        ])
    }
}
