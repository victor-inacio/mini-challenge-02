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
    var dateLabel = Label(localizedTextKey: "")
    let stackView = StackView(axis: .horizontal, distribution: .equalSpacing)
    var isEmpty : Bool?
    var labelIsEmpty = Label(localizedTextKey: "Oh não! Você está sem tarefas.", font: .medium)
    var modalTips = ModalTips()
    lazy var closeAnchorModalFeeling = modalTips.topAnchor.constraint(equalTo: self.view.bottomAnchor)
    lazy var endModalFeelingAnchor = modalTips.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)

    
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
        view.addSubview(modalTips)
        
        NSLayoutConstraint.activate([
            closeAnchorModalFeeling,
//            modalTips.topAnchor.constraint(equalTo: bodyJournal.topAnchor),
            modalTips.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.9),
            modalTips.widthAnchor.constraint(equalToConstant: view.bounds.width)
            //OBS: Comentar linha de código abaixo para deixar modal alinhada com body
//            modalFeeling.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.viewDidLoad()
    }
    
    private func setup() {
//        setupDatePicker()
        setupHeader()
        setupButtonCalendarAndLabel()
        setupCollectioView()
        setlabelIsEmpty()
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
            stackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 26),
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
            collection.topAnchor.constraint(equalTo:        stackView.bottomAnchor, constant: 16),
            collection.bottomAnchor.constraint(equalTo:     view.safeAreaLayoutGuide.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo:    view.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo:   view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Esta é a função chamada quando uma célula é clicada
        // Você pode imprimir uma mensagem no terminal aqui
        print("Célula na seção \(indexPath.section) e item \(indexPath.item) foi clicada.")
        openModalTips()
    }

    
    private func bind() {
        viewModel.data.observeAndFire(on: self) { [unowned self] data in
            self.loadData()
            
            self.isEmpty = viewModel.isEmpty()
                   
            if isEmpty! {
                collection.isHidden = true
                labelIsEmpty.isHidden = false
            } else {
                   labelIsEmpty.isHidden = true
                   collection.isHidden = false
            }

        }
        
        viewModel.date.observe(on: self) { date in
            self.dateLabel.text = self.viewModel.dateToString.makeDate(date: date)
        }
    }
    
    private func setlabelIsEmpty() {
        
        
        view.addSubview(labelIsEmpty)
        
        NSLayoutConstraint.activate([
            labelIsEmpty.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelIsEmpty.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        labelIsEmpty.isHidden = true
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
            headerView.topAnchor.constraint(equalTo:  self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
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
    
    func openModalTips() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            print("Tentando abrir modal")
            self.startMenuAnimation()
        }

        self.modalTips.isOpen.toggle()
    }

    func startMenuAnimation() {
        if modalTips.isOpen {
            // Abre o modal
            print("abrindo modal 🥑")

            self.closeAnchorModalFeeling.isActive = false
            self.endModalFeelingAnchor.isActive = true
        } else {
            // Fecha o modal
            print("fechando modal 🍕")

            self.endModalFeelingAnchor.isActive = false
            self.closeAnchorModalFeeling.isActive = true
        }
        
        // Certifique-se de chamar layoutIfNeeded para ativar as âncoras.
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }

    //AbreModal
    func openModalFeelings() {
        self.closeAnchorModalFeeling.isActive = false
        self.endModalFeelingAnchor.isActive = true
    }

    //FechaModal
    func closeModalFeelings() {
        self.endModalFeelingAnchor.isActive = false
        self.closeAnchorModalFeeling.isActive = true
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
