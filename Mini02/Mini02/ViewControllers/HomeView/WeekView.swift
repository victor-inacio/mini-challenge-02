//
//  WeekView.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 24/09/23.
//

import UIKit

class WeekView: UIView {
    private var contentStackView: UIStackView = {
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
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupConstrains()
    }
    
    /// Adiciona os elementos dentro da stackView
    func setupView() {

        var label1 = UILabel()
        label1.text = "se inscreva"
        label1.font = .systemFont(ofSize: 32)
        label1.backgroundColor = UIColor.blue
        contentStackView.addArrangedSubview(label1)
        
        var label2 = UILabel()
        label2.text = "se inscreva"
        label2.font = .systemFont(ofSize: 32)
        label2.backgroundColor = UIColor.blue
        contentStackView.addArrangedSubview(label2)
        
        var label3 = UILabel()
        label3.text = "se inscreva"
        label3.font = .systemFont(ofSize: 32)
        label3.backgroundColor = UIColor.blue
        contentStackView.addArrangedSubview(label3)
        
        var label4 = UILabel()
        label4.text = "se inscreva"
        label4.font = .systemFont(ofSize: 32)
        label4.backgroundColor = UIColor.blue
        contentStackView.addArrangedSubview(label4)
        
        var label5 = UILabel()
        label5.text = "se inscreva"
        label5.font = .systemFont(ofSize: 32)
        label5.backgroundColor = UIColor.blue
        contentStackView.addArrangedSubview(label5)
        
        var label6 = UILabel()
        label6.text = "se inscreva"
        label6.font = .systemFont(ofSize: 32)
        label6.backgroundColor = UIColor.blue
        contentStackView.addArrangedSubview(label6)
        
        var label7 = UILabel()
        label7.text = "se inscreva"
        label7.font = .systemFont(ofSize: 32)
        label7.backgroundColor = UIColor.blue
        contentStackView.addArrangedSubview(label7)
        
        addSubview(contentStackView)
        
    }
    
    func setupConstrains() {
        backgroundColor = .white
        
        // Define as restrições da contentStackView para preencher a WeekView
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 700)
        ])
    }
    
}

class DayCircle: UIView {
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           backgroundColor = UIColor.blue
       }

       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           backgroundColor = UIColor.clear
       }

       override func draw(_ rect: CGRect) {
           // Obtém o contexto gráfico atual
           if let context = UIGraphicsGetCurrentContext() {
               // Configura a cor do preenchimento e a cor da linha
               context.setFillColor(UIColor.blue.cgColor)
               context.setStrokeColor(UIColor.blue.cgColor)

               // Cria um retângulo que se ajusta ao tamanho da view
               let circleRect = CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height)

               // Desenha o círculo no contexto
               context.fillEllipse(in: circleRect)
           }
       }
}

#Preview {
    WeekView()
}

