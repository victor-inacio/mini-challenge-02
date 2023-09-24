//
//  WeekView.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 24/09/23.
//

import UIKit

class WeekView: UIView {
    var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.axis = .horizontal
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
//        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
//        setupConstrains()
    }
    
    
    /// Adiciona os elementos dentro da stackView
    func setupView() {
        
//        view.addSubview(contentStackView)
        
        let days:[String] = ["dom", "seg", "ter", "qua", "quin", "sex", "sab"]
        
        for i in 1...7 {
            let labelDate = UILabel()
            labelDate.text = "10/11"
            
            let labelDayOfWeek = UILabel()
            labelDayOfWeek.text = days[i - 1]
            
            labelDate.font = .systemFont(ofSize: 10)
            labelDayOfWeek.font = .systemFont(ofSize: 10)

            
            let dayWeek = DayWeekView(circle: DayCircle(), labelDate: labelDate, labelDayOfWeek: labelDayOfWeek)
            
            contentStackView.addArrangedSubview(dayWeek)
        }
    }
//    
//    func setupConstrains() {
//        
//        // Define as restrições da contentStackView para preencher a WeekView
//        contentStackView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
//            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
////            contentStackView.bottomAnchor.constraint(equalTo: headerView.topAnchor)
//        ])
//    }
}

class DayCircle: UIView {
    
    let circleSize: CGFloat = 40.0 // Defina o tamanho desejado aqui
    
    override init(frame: CGRect) {
        let adjustedFrame = CGRect(x: frame.origin.x, y: frame.origin.y, width: circleSize, height: circleSize)
        super.init(frame: adjustedFrame)
        backgroundColor = UIColor(red: 0.23, green: 0.58, blue: 0.76, alpha: 1.0)
        layer.cornerRadius = circleSize / 2.0
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
    }

//    override func draw(_ rect: CGRect) {
//        // Você não precisa mais do código de desenho, pois o tamanho é fixo
//    }
}


#Preview {
    WeekView()
}

