//
//  StatisticView.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//
import UIKit

class StatisticViewController: UIViewController, MVVMCView {
    
    var modelView: StatisticsViewModel!
    let statisticsBox = StatisticsBoxView()
    let titleLabel1 = UILabel()
    let titleLabel2 = UILabel()
    let titleLabel3 = UILabel()
    let statisticsBox2 = FeelingBoxView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .light
        
        // Configuração dos títulos
        statisticsBox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statisticsBox)
        
        // Adiciona informações à box
        statisticsBox.addStatisticInfo("Atividades completas:", accessibilityLabel: "Atividades completas", accessibilityHint: "Total de Atividades que já foram realizadas")
        statisticsBox.addStatisticInfo("Dias feitos seguidamente:", accessibilityLabel: "Dias feitos seguidamente", accessibilityHint: "Dias seguidos onde tarefas foram realizadas")
        statisticsBox.addStatisticInfo("Record de Streaks:", accessibilityLabel: "Record de Streaks", accessibilityHint: "Número total de Dias feitos seguidamentes")
        
        // Cria o primeiro título
        titleLabel1.text = "Estatísticas"
        titleLabel1.font = UIFont.boldSystemFont(ofSize: 40)
        titleLabel1.translatesAutoresizingMaskIntoConstraints = false
        titleLabel1.accessibilityLabel = "Estatísticas"
        titleLabel1.accessibilityHint = "Estatísticas sobre ações que foram feitas nesse App"
        view.addSubview(titleLabel1)
        
        // Cria o segundo título
        titleLabel2.text = "Informações Gerais"
        titleLabel2.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel2.translatesAutoresizingMaskIntoConstraints = false
        titleLabel2.accessibilityLabel = "Informações Gerais"
        titleLabel2.accessibilityHint = "Registros gerais sobre ações feitas no app"
        view.addSubview(titleLabel2)
        
        // Cria o terceiro título
        titleLabel3.text = "Feedback de Sentimentos"
        titleLabel3.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel3.translatesAutoresizingMaskIntoConstraints = false
        titleLabel3.accessibilityLabel = "Sentimentos"
        titleLabel3.accessibilityHint = "Classificações que foram dadas a cada tarefa"
        view.addSubview(titleLabel3)
        
        // Configuração de espaçamento
        let spacing: CGFloat = 20
        
        // Configuração da segunda box
        statisticsBox2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statisticsBox2)
        
        statisticsBox2.addImageAndLabel("feeling_1", labelText: "0",accessibilityHint: "Número de Reações do Emoji 1")
        statisticsBox2.addImageAndLabel("feeling_2", labelText: "0",accessibilityHint: "Número de Reações do Emoji 2")
        statisticsBox2.addImageAndLabel("feeling_3", labelText: "0",accessibilityHint: "Número de Reações do Emoji 3")
        statisticsBox2.addImageAndLabel("feeling_4", labelText: "0",accessibilityHint: "Número de Reações do Emoji 4")
        statisticsBox2.addImageAndLabel("feeling_5", labelText: "0",accessibilityHint: "Número de Reações do Emoji 5")
        
      
        NSLayoutConstraint.activate([
            // Constraints para a segunda "box"
            statisticsBox2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statisticsBox2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            statisticsBox2.topAnchor.constraint(equalTo: titleLabel3.bottomAnchor, constant: spacing),
            
            
            // Constraints para centralizar horizontalmente cada título
            titleLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // Recua o título "Estatísticas" à esquerda
            titleLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Constraints para o topo de cada título
            titleLabel1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            titleLabel2.topAnchor.constraint(equalTo: titleLabel1.bottomAnchor, constant: 30), // Aumente o valor da constante para aumentar o espaço
            titleLabel3.topAnchor.constraint(equalTo: statisticsBox.bottomAnchor, constant: spacing),
            
            // Constraints para a box de estatísticas
            statisticsBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statisticsBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            statisticsBox.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor, constant: spacing),

            
        ])
    
    }
    
}


    #Preview{
        StatisticViewController()
    }
    
    
    

