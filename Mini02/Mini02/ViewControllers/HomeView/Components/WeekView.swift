//
//  WeekView.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 24/09/23.
//

import UIKit

///View que contém a parte visual de uma semana.
class WeekView: UIView {
    
    var vm: WeekViewModel!
    
    var stackView: UIStackView = { //Configuração da contentStackView
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.axis = .horizontal
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewModel()
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViewModel()
        setupView()
    }
    
    ///Adiciona ViewModel a class.
    func setViewModel() {
        vm = WeekViewModel(weekView: self)
    }
    
    
    /// Adiciona os elementos dentro da stackView
    func setupView() {
                
        let days:[String] = ["dom", "seg", "ter", "qua", "quin", "sex", "sab"]
        
        for i in 1...7 {
            let labelDate = UILabel()
            labelDate.text = "10/11"
            
            let labelDayOfWeek = UILabel()
            labelDayOfWeek.text = days[i - 1]
            
            labelDate.font = .systemFont(ofSize: 10)
            labelDayOfWeek.font = .systemFont(ofSize: 10)

            
            let dayWeek = DayWeekView(circle: DayCircle(), labelDate: labelDate, labelDayOfWeek: labelDayOfWeek)
                        
//            let tapGesture = UITapGestureRecognizer(target: vm, action: #selector(vm.dayOfWeekTapped(_:)))
//            dayWeek.addGestureRecognizer(tapGesture)
            
            stackView.addArrangedSubview(dayWeek)
        }
    }

}



//#Preview {
//    WeekView()
//}

