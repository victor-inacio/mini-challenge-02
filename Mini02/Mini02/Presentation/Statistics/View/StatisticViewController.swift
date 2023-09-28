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
        
        // MARK: - Configuração do UIScrollView
        
        // Cria um UIScrollView para conter todos os elementos
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        
        // MARK: - Configuração do contentView
        
        // Cria uma view para colocar todos os elementos dentro do UIScrollView
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        // MARK: - Configuração dos títulos
        let statisticsBox = StatisticsBoxView()
              statisticsBox.translatesAutoresizingMaskIntoConstraints = false
              contentView.addSubview(statisticsBox)
              
              // Adiciona informações à box
              statisticsBox.addStatisticInfo("Atividades completas:")
              statisticsBox.addStatisticInfo("Dias feitos seguidamente:")
              statisticsBox.addStatisticInfo("Record de Streaks:")
        
        
        // Cria o primeiro título
        let titleLabel1 = UILabel()
        titleLabel1.text = "Estatísticas"
        titleLabel1.font = UIFont.boldSystemFont(ofSize: 40)
        titleLabel1.translatesAutoresizingMaskIntoConstraints = false
        
        // Cria o segundo título
        let titleLabel2 = UILabel()
        titleLabel2.text = "Informações Gerais"
        titleLabel2.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel2.translatesAutoresizingMaskIntoConstraints = false
        
        // Cria o terceiro título
        let titleLabel3 = UILabel()
        titleLabel3.text = "Sentimentos"
        titleLabel3.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel3.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel1)
        contentView.addSubview(titleLabel2)
        contentView.addSubview(titleLabel3)
        
        // MARK: - Configuração de espaçamento
        
        let spacing: CGFloat = 20
        
        // MARK: - Configuração da box
        
        let boxView = StatisticsBoxView()
        boxView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(boxView)
        boxView.addStatisticInfo("Test")

        
        // MARK: - Configuração de Constraints
        
        // Configura as constraints para posicionar os títulos e a box de estatísticas dentro do contentView
        NSLayoutConstraint.activate([
            // Constraints para o primeiro título (Título Maior)
            titleLabel1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel1.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20), // Leva em consideração a safe area
            titleLabel1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20), // Margem à direita
            
            // Constraints para o segundo título (Informações Gerais)
            titleLabel2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel2.topAnchor.constraint(equalTo: titleLabel1.bottomAnchor, constant: 10),
            titleLabel2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Constraints para a box de estatísticas
            statisticsBox.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            statisticsBox.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            statisticsBox.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor, constant: 10),


            
            // Constraints para o terceiro título (Outras Informações)
            titleLabel3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel3.topAnchor.constraint(equalTo: statisticsBox.bottomAnchor, constant: spacing),
               titleLabel3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Constraints para o background
            boxView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            boxView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            boxView.topAnchor.constraint(equalTo: titleLabel3.bottomAnchor, constant: 10),
            boxView.heightAnchor.constraint(equalToConstant: 100),
            boxView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20), // Garante que o contentView seja maior que a boxView
        ])
        
        // MARK: - Configuração de Constraints para o ScrollView e contentView
        
        // Configura as constraints para o scrollView e contentView
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor), // Garante que o contentView seja do mesmo tamanho que o scrollView
            contentView.bottomAnchor.constraint(greaterThanOrEqualTo: scrollView.bottomAnchor), // Garante o conteúdo suficiente para rolagem
    
        
        
        ])
    }
    
}

#Preview{
    StatisticViewController()
}



