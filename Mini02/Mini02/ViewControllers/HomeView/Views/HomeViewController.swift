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
    
    let scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true // Ativa a paginação horizontal
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground

        view.addSubview(scrollView)
        setLayoutScrollView()
        
        scrollView.addSubview(contentView)
        setLayoutContentView()
        
        //Criando WeekView
        contentView.addSubview(weekView.stackView) // Adicione ao contentView, não diretamente à view
        
        setupConstrainsWeek()
        
        populateStackView() // Chame essa função para preencher a scrollView
        
        // Cria o cabeçalho com o título e o botão
//        setHeaderView()
        
    }
    
    @objc func buttonTapped() {
        // Ação do botão
        print("Botão foi tocado.")
    }
    
    func setLayoutScrollView() {
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Centraliza horizontalmente
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor), // Centraliza verticalmente
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor), // Define a largura igual à largura da tela
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor) // Define a altura igual à altura da tela
        ])
    }
    
    func setLayoutContentView() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            // Remova a constraint de altura, pois queremos que o contentView tenha altura dinâmica com base no conteúdo
        ])
    }
    
    func populateStackView() {
        let numberOfWeeks = weekNumberForSunday(for: Date())
        var weekViews: [WeekView] = [] // Inicialize o array vazio
        
        for _ in 0..<numberOfWeeks {
            let weekView = WeekView() // Crie uma nova instância de WeekView
            weekView.setupView() // Chame o método setupView da instância
            
            contentView.addSubview(weekView) // Adicione a instância ao contentView
            
            weekViews.append(weekView) // Adicione a instância ao array
        }
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
    
    func weekNumberForSunday(for date: Date) -> Int {
        var calendar = Calendar.current
        calendar.firstWeekday = 1 // Define o primeiro dia da semana como domingo
        
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)
        
        if let year = components.yearForWeekOfYear, let weekNumber = components.weekOfYear {
            return weekNumber
        }
        
        return 52
    }
    
}


#Preview{
    HomeViewController()
}

