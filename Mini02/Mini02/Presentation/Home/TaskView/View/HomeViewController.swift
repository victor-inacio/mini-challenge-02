//
//  ViewController.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

import UIKit

class HomeViewController: UIViewController, MVVMCView {
    
    var modelView: HomeViewModel! 
    let headerView = HeaderView()
    let datePicker = UIDatePicker()
    
    private let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    var dataSource: UICollectionViewDiffableDataSource<Section, Int>!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setup()
    }
    
    private func setup() {
        setupDatePicker()
        setupHeader()
        setupCollectioView()
    }
    
    //MARK: - Setup da CollectionView
    private func setupCollectioView(){
        configDataSource()
        collection.dataSource = dataSource
        collection.delegate = self
        collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.CellIdentifier)
        view.addSubview(collection)
        
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo:        headerView.bottomAnchor, constant: 16),
            collection.bottomAnchor.constraint(equalTo:     view.safeAreaLayoutGuide.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo:    view.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo:   view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    //Configura o dataSource da CollectionView
    func configDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: self.collection, cellProvider: { [self] collectionView, indexPath, itemIdentifier in
        
            guard let cell = self.collection.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.CellIdentifier, for: indexPath) as? CollectionViewCell else { fatalError() }
            return cell
        })
        
        var initialSnapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        initialSnapshot.appendSections([.doing])
        initialSnapshot.appendItems(Array(0...4), toSection: .doing)
        
        dataSource.apply(initialSnapshot, animatingDifferences: false)
    }
    
    //MARK: - Setup DatePicker
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.timeZone = .autoupdatingCurrent
        self.view.addSubview(datePicker)
        
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            datePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            datePicker.widthAnchor.constraint(equalTo: view.widthAnchor),
            datePicker.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
    }
    
    //MARK: - Setup Header
    private func setupHeader() {
        // Cria o cabeçalho com o título e o botão
        headerView.titleLabel.text = "Suas Tarefas"
        
        headerView.actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(headerView)
        
        // Configura as constraints para o cabeçalho
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: datePicker.bottomAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 44), // Altura do cabeçalho
        ])
    }
    
    @objc func buttonTapped() {
//        var oldSnapshot = dataSource.snapshot()
//        oldSnapshot.appendItems([oldSnapshot.numberOfItems + 1])
//        dataSource.apply(oldSnapshot)
        modelView.coordinator.goToCreateNewTask()
    }
}

#Preview {
    HomeViewController()
}
