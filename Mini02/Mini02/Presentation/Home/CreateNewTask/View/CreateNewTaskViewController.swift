//
//  CreateNewTaskViewController.swift
//  Mini02
//
//  Created by Luca Lacerda on 27/09/23.
//

import UIKit

class CreateNewTaskViewController: UIViewController, MVVMCView {
    
    var modelView: CreateNewTaskViewModel!
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("teste", for: .normal)
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.addTarget(self, action: #selector(returnToHome), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func returnToHome() {
        self.modelView.coordinator.returnToParent()
//        if self.modelView != nil {
//            print("existe")
//        } else {
//            print("n existe")
//        }
    }
}
