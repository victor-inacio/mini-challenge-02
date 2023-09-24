//
//  DayCircleViewModel.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 24/09/23.
//

import UIKit

class DayWeekViewModel {
    let view: DayWeekView
    
    init(view: DayWeekView) {
        self.view = view
    }
    
    //MARK: Função ao clicar no dia da semana
    @objc func dayOfWeekTapped(_ sender: UITapGestureRecognizer) {
        // Lidar com o toque em um dia da semana aqui
        print("clicado")
        if let dayWeekView = sender.view as? DayWeekView {
            // Acessar as informações da DayWeekView tocada, se necessário
            print("Dia da semana tocado: \(dayWeekView.labelDayOfWeek.text ?? "")")
            
            let dateString = "2023-09-25"
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"

            if let date = dateFormatter.date(from: dateString) {
                let calendar = Calendar.current
                let dayOfWeek = calendar.component(.weekday, from: date)
                
                // Use o array shortWeekdaySymbols para obter a abreviação do dia da semana
                let dayOfWeekAbbr = dateFormatter.shortWeekdaySymbols[dayOfWeek - 1] // -1 porque o array começa em 0
                
                print("O dia da semana é: \(dayOfWeekAbbr)")
            } else {
                print("Data inválida")
            }

        }
    }
    
}
