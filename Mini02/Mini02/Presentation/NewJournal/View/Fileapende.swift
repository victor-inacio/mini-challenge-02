//
//  Fileapende.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 29/09/23.
//

import UIKit

class Fileapende: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stack1 = StackView(axis: .horizontal, spacing: 20, distribution: .equalSpacing)
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .equalCentering
        stack.isLayoutMarginsRelativeArrangement = true
        
        view.addSubview(stack)
        
        stack.backgroundColor = .systemPink

        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200)

        ])
//        
//        let quadrado = UIView()
//        quadrado.backgroundColor = .yellow
//        quadrado.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
//        quadrado.translatesAutoresizingMaskIntoConstraints = false
//        
//        let quadrado1 = UIView()
//        quadrado1.backgroundColor = .blue
//        quadrado1.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
//
//        
//        let quadrado2 = UIView()
//        quadrado2.backgroundColor = .green
//        quadrado2.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        
        let lab = UILabel()

        let lab1 = UILabel()
        let lab2 = UILabel()
        
        lab.text = "lab"
        lab1.text = "lab1"
        lab2.text = "lab2"

//        lab.translatesAutoresizingMaskIntoConstraints = false
//        lab1.translatesAutoresizingMaskIntoConstraints = false
//        lab2.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(lab)
        stack.addArrangedSubview(lab1)
        stack.addArrangedSubview(lab2)
        
        
    }
}

#Preview(traits: .defaultLayout, body: {
    Fileapende()
})
