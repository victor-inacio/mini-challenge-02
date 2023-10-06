//
//  TitleDate.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 06/10/23.
//

import UIKit

class TitleDate: UIButton {
    
    init() {
        super.init(frame: .zero)
        
        self.tintColor = .fontColorNewJournalTitle
        self.setTitle(setDateLabel() as? String, for: .normal)
        self.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 24)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDateLabel() -> Any {
        let dateFormatter = DateFormatter()
        
        //Estilo do dateFormatter
        dateFormatter.dateFormat = "dd 'de' MMM yyyy"
        
        // Obtenha a data atual
        let currentDate = Date()
        
        // Formatando a data atual com o estilo formatado
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate
    }
}
