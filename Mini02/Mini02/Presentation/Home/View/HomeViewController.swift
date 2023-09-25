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
        self.view.backgroundColor = .blue
        
        
        tabBarItem = UITabBarItem(title: "Home", image: .init(systemName: "gear"), tag: 0)
        title = "Home"
        
        let tasks = modelView.getTasks()
        
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10
        
        for task in tasks {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.configuration = .bordered()
            button.setTitle(task, for: .normal)
            button.backgroundColor = .yellow
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 8
            stack.addArrangedSubview(button)
        }
        
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
    }
    
    @objc func onTap() {
        
    }
}
