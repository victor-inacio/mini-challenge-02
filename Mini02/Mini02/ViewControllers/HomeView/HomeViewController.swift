//
//  ViewController.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

import UIKit

class HomeViewController: UIViewController {

    var texts:[String] = [
        "1",
        "2",
        "3"
    ]
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.configuration = .filled()
//        button.addTarget(self, action: #selector(addCell), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBackground
        return button
    }()
    
    private let collection: UICollectionView = {
        let collection  = UICollectionView()
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        collection.dataSource = self
        collection.delegate = self
        
    }
}
