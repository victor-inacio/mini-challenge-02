//
//  AddTaskButton.swift
//  Mini02
//
//  Created by Luca Lacerda on 28/09/23.
//

import UIKit

class AddTaskButton: UIControl {
    
    private weak var imageView: UIImageView?
    
    private var image = UIImage()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        if let image = UIImage(named: "button_fn"){
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            self.imageView = imageView
            self.backgroundColor = UIColor.clear
            self.translatesAutoresizingMaskIntoConstraints = false
        }else {
          
        }
    }
    
}
