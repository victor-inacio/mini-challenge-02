//
//  ModalDayWeek.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 24/09/23.
//

import UIKit

///Corresponde a parte visual de 1 dia da WeeView.
class DayWeekView: UIView {
    var circle: UIView
    var labelDate: UILabel
    var labelDayOfWeek: UILabel
    var date = Date()
    
    var vm: DayWeekViewModel!
    
    init(circle: UIView, labelDate: UILabel, labelDayOfWeek: UILabel) {
        self.labelDate = labelDate
        self.circle = circle
        self.labelDayOfWeek = labelDayOfWeek
        super.init(frame: .zero)
        setViewModel()
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViewModel() {
        vm = DayWeekViewModel(view: self)
    }
  
    private func commonInit() {
        // Configura a aparência da view aqui
        backgroundColor = .clear
        
        // Configura o layout da view para estender-se e preencher o espaço disponível
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        labelDayOfWeek.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(labelDate)
        addSubview(labelDayOfWeek)
        addSubview(circle)
        
        // Adicione restrições para o círculo
        NSLayoutConstraint.activate([
            circle.centerXAnchor.constraint(equalTo: centerXAnchor),
            circle.topAnchor.constraint(equalTo: topAnchor),
            circle.widthAnchor.constraint(equalToConstant: 40), // Largura do círculo
            circle.heightAnchor.constraint(equalTo: circle.widthAnchor) // Garante que o círculo seja um quadrado
        ])
        
        // Adicione restrições para a label de data
        NSLayoutConstraint.activate([
            labelDate.bottomAnchor.constraint(equalTo: circle.topAnchor, constant: -6), // Espaçamento entre o círculo e a label
            labelDate.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        // Adicione restrições para a label de dia da semana
        NSLayoutConstraint.activate([
            labelDayOfWeek.topAnchor.constraint(equalTo: circle.bottomAnchor, constant: 4), // Espaçamento entre a label de data e a label de dia da semana
            labelDayOfWeek.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelDayOfWeek.bottomAnchor.constraint(equalTo: bottomAnchor) // Certifique-se de que a label de dia da semana alcance a parte inferior
        ])
        
        // Configura o gesto de toque para chamar o método dayOfWeekTapped(_:) da ViewModel quando a DayWeekView for tocada
        let tapGesture = UITapGestureRecognizer(target: vm, action: #selector(vm.dayOfWeekTapped(_:)))
        addGestureRecognizer(tapGesture)
    }
}

