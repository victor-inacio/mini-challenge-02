//
//  ViewController.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var texts:[Int] = [
        
    ]
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.configuration = .filled()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: <#T##Selector#>, for: .touchUpInside)
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .grouped)
        tableView.register(HomeTableCell.self, forCellReuseIdentifier: HomeTableCell.CellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(tableView)
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            
            button.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1),
            button.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            
            tableView.topAnchor.constraint(equalTo: self.button.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }
    
    @objc func add(){
        self
    }
    
}

#Preview{
    HomeViewController()
}
