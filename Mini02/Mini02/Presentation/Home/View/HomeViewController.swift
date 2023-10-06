//
//  ViewController.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

import UIKit

class HomeViewController: UIViewController, MVVMCView, dateModalDelegate {
    
    var modelView: HomeViewModel!
    let headerView = HeaderView()
    let datePicker = DatePicker()
    var buttonCalendar = Button()
    var dateLabel = Label(text: "")
    
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
        self.view.backgroundColor = UIColor(named: "Background")
        setup()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setup() {
//        setupDatePicker()
        setupButtonCalendarAndLabel()
        setupHeader()
        setupCollectioView()
    }
    
    //MARK: - Calendar Button
    private func setupButtonCalendarAndLabel(){
        let stackView = StackView(axis: .horizontal, spacing: 10)
        
        dateLabel.text = modelView.dateToString.makeDate(date: modelView.date)
        
        buttonCalendar.setImage(UIImage(named: "calendarButton"), for: .normal)
        buttonCalendar.imageView?.contentMode = .scaleToFill
        buttonCalendar.addTarget(self, action: #selector(buttonCalendarModal), for: .touchUpInside)
         
        stackView.addArrangedSubview(buttonCalendar)
        stackView.addArrangedSubview(dateLabel)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ])
    }
    
    //MARK: - Setup da CollectionView
    private func setupCollectioView(){
        configDataSource()
        collection.dataSource = dataSource
        collection.delegate = self
        collection.backgroundColor = self.view.backgroundColor
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
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOpacity = 0.2
            cell.layer.shadowOffset = CGSize(width: 0, height: 8)
            cell.layer.shadowRadius = 10
            cell.config(task: modelView.tasks![indexPath.row])

            return cell
        })
        
        var initialSnapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        initialSnapshot.appendSections([.doing])
        initialSnapshot.appendItems(Array(0...self.modelView.tasks!.count-1), toSection: .doing)
        
        dataSource.apply(initialSnapshot, animatingDifferences: false)
    }
    
    //MARK: - Setup DatePicker
    private func setupDatePicker() {
        self.view.addSubview(datePicker)
        
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            datePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            datePicker.widthAnchor.constraint(equalTo: view.widthAnchor),
            datePicker.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
    }
    
    //MARK: - Setup Header
    private func setupHeader() {
        headerView.actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.view.addSubview(headerView)
        
        // Configura as constraints para o cabeçalho
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo:  buttonCalendar.bottomAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 44), // Altura do cabeçalho
        ])
    }
    
    //MARK: - Button Functions
    @objc func buttonCalendarModal(){
        let vc = CallendarPickerViewModal()
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .medium()]
        }
        vc.delegate = self
        vc.modalPresentationStyle = .automatic
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func buttonTapped() {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd/mm/yyyy"
//        let date = dateFormatter.string(from: datePicker.date)
//        print(date)
        self.modelView.coordinator.goToCreateNewTask()
    }
    
    //MARK: - Delegate que recebe a data da modal
    func datePass(date: Date) {
        dateLabel.text = modelView.dateToString.makeDate(date: date)
    }
    
}
