//
//  ViewController.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

import UIKit

class HomeViewController: UIViewController, MVVMCView {

    var modelView: HomeViewModel!
    
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
