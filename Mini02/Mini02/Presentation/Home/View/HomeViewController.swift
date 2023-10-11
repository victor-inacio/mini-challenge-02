//
//  ViewController.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

import UIKit

class HomeViewController: UIViewController, MVVMCView, dateModalDelegate {
   
    
    
    var viewModel: HomeViewModel!
    let headerView = HeaderView()
    let datePicker = DatePicker()
    var buttonCalendar = UIButton()
    var dateLabel = Label(text: "")
    let stackView = StackView(axis: .horizontal, distribution: .equalSpacing)
    
    private let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    var dataSource: UICollectionViewDiffableDataSource<Section, ActiveTask.ID>!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "Background")
        setup()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.viewDidLoad()
    }
    
    private func setup() {
//        setupDatePicker()
        setupButtonCalendarAndLabel()
        setupHeader()
        setupCollectioView()
        bind()
        
        viewModel.viewDidLoad()
    }
    
    //MARK: - Calendar Button
    private func setupButtonCalendarAndLabel(){
        stackView.layer.cornerRadius = 20
        stackView.spacing = 0
        stackView.backgroundColor = UIColor(named: "buttonBackground")
        
        let space = UIView()
        space.backgroundColor = .clear
        space.translatesAutoresizingMaskIntoConstraints = false
        
        let space2 = UIView()
        space2.backgroundColor = .clear
        space2.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.text = viewModel.dateToString.makeDate(date: viewModel.date.value)
        
        buttonCalendar.setImage(UIImage(named: "calendarButton"), for: .normal)
        buttonCalendar.imageView?.contentMode = .scaleToFill
        buttonCalendar.addTarget(self, action: #selector(buttonCalendarModal), for: .touchUpInside)
        buttonCalendar.layer.shadowOffset = CGSize(width: 2, height: 2) //Tamanho da shadow
        buttonCalendar.layer.shadowRadius = 4 //Distância da shadow
        buttonCalendar.layer.shadowOpacity = 0.3
        buttonCalendar.layer.shadowColor = UIColor.black.cgColor
         
        stackView.addArrangedSubview(space2)
        stackView.addArrangedSubview(buttonCalendar)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(space)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.widthAnchor.constraint(equalTo: dateLabel.widthAnchor, multiplier: 1.5),
            
//            buttonCalendar.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -16),
            
            dateLabel.centerYAnchor.constraint(equalTo: buttonCalendar.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: buttonCalendar.trailingAnchor)
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
            collection.topAnchor.constraint(equalTo:        headerView.bottomAnchor, constant: 26),
            collection.bottomAnchor.constraint(equalTo:     view.safeAreaLayoutGuide.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo:    view.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo:   view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func bind() {
        viewModel.data.observeAndFire(on: self) { [unowned self] data in
            self.loadData()
        }
        
        viewModel.date.observe(on: self) { date in
            self.dateLabel.text = self.viewModel.dateToString.makeDate(date: date)
        }
    }
    
    //Configura o dataSource da CollectionView
    func configDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, ActiveTask.ID>(collectionView: self.collection, cellProvider: { [self] collectionView, indexPath, itemIdentifier in
        
            guard let cell = self.collection.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.CellIdentifier, for: indexPath) as? CollectionViewCell else { fatalError() }
            cell.layer.shadowOpacity = 0.2
            cell.layer.shadowOffset = CGSize(width: 0, height: 8)
            cell.layer.shadowRadius = 10
            for completedTask in viewModel.data.value.completedTasks {
                if completedTask.id == itemIdentifier {
                    cell.config(task: completedTask)
                }
            }
            
            for uncompletedTask in viewModel.data.value.uncompletedTasks {
                if uncompletedTask.id == itemIdentifier {
                    cell.config(task: uncompletedTask)
                }
            }
            
            
            cell.delegate = self
            
            return cell
        })
        
        loadData()
    }
    

    private func loadData() {
        var initialSnapshot = NSDiffableDataSourceSnapshot<Section, ActiveTask.ID>()
        initialSnapshot.appendSections([.doing, .done])
        
        initialSnapshot.appendItems(viewModel.data.value.uncompletedTasks.map({ task in
            task.id
        }), toSection: .doing)
        
        initialSnapshot.appendItems(viewModel.data.value.completedTasks.map({ task in
            task.id
        }), toSection: .done)
        
        dataSource.apply(initialSnapshot, animatingDifferences: true)
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
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            headerView.topAnchor.constraint(equalTo:  stackView.bottomAnchor, constant: 16),
            headerView.heightAnchor.constraint(equalToConstant: 20)
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
        self.viewModel.coordinator.goToCreateNewTask()
        HapticManager.shared.generateHapticFeedback(style: .heavy)

    }
    
    //MARK: - Delegate que recebe a data da modal
    func datePass(date: Date) {
        
        viewModel.didChangeDate(date: date)
    }
    
    
    
}

extension HomeViewController: CollectionViewCellDelegate {
    func onCollectionViewCellCheckChange(_ checked: Bool, task: ActiveTask) {
        if (checked) {
            viewModel.completeTask(task: task)
        } else {
            viewModel.uncompleteTask(task: task)
        }
    }
    
    func onCollectionViewCellDeleted(_ task: ActiveTask) {
        viewModel.deleteTask(task: task) {
            
        }
    }
}
