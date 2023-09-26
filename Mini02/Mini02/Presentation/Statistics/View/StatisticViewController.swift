//
//  StatisticView.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

import UIKit

class StatisticViewController: UIViewController, MVVMCView {
    
    var modelView: StatisticsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        // Cria o primeiro título
        let titleLabel1 = Label(text: "Estatísticas")
        titleLabel1.font = UIFont.boldSystemFont(ofSize: 40)
        
        // Cria o segundo título
        let titleLabel2 = Label(text: "Informações Gerais")
        titleLabel2.font = UIFont.boldSystemFont(ofSize: 18)
        
        // Cria o terceiro título
        let titleLabel3 = Label(text: "Sentimentos")
        titleLabel3.font = UIFont.boldSystemFont(ofSize: 18)
        
        self.view.addSubview(titleLabel1)
        self.view.addSubview(titleLabel2)
        self.view.addSubview(titleLabel3)
        
        let spacing: CGFloat = 20
        
        let boxView = UIView()
        boxView.backgroundColor = UIColor(named: "box_bg")
        boxView.layer.cornerRadius = 15
        boxView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(boxView)
        
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
            
            // Constraints para o terceiro título (Outras Informações)
            titleLabel3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel3.topAnchor.constraint(equalTo: statisticsBox.bottomAnchor, constant: spacing),
            
            // Constraints para a caixa de fundo
            boxView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            boxView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            boxView.topAnchor.constraint(equalTo: titleLabel3.bottomAnchor, constant: 10),
            boxView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}


  #Preview{
      StatisticViewController()
  }

