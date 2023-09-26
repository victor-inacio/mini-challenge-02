//
//  DayCircleViewModel.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 24/09/23.
//

import UIKit

/// ViewModel para a DayWeekView.
class DayWeekViewModel {
    let view: DayWeekView
    
    init(view: DayWeekView) {
        self.view = view
    }
    
    //MARK: Função ao clicar no dia da semana
    @objc func dayOfWeekTapped(_ input: UITapGestureRecognizer) {
        
        if let dayWeekView = input.view as? DayWeekView {
                                  
            calcDayOfWeek(dateString: formatDate(date: view.date))
            
            print(weekNumberForSunday(for: view.date))
        }
    }
    
    func calcDayOfWeek(dateString: String) {
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
    
    ///Formata datas do tipo Date() para yyyy-MM-dd
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" //Definindo formatação das datas
        
        //Formatando data do dia da semana
        let dateString = dateFormatter.string(from: view.date)
        
        return dateString //Retorna data formatada ex: 2023-02-08
    }
    
//    func findLastSunday(from date: Date) -> Date? {
//        let calendar = Calendar.current
//        let weekday = calendar.component(.weekday, from: date)
//        
//        // Calcula quantos dias atrás é o último domingo
//        let daysToSubtract = (weekday - 1) % 7
//        
//        // Subtrai os dias para obter o último domingo
//        if let lastSunday = calendar.date(byAdding: .day, value: -daysToSubtract, to: date) {
//            return lastSunday
//        }
//        
//        return nil
//    }
//    
    ///Retorna a semana do ano (contando que a primeira semana do ano começa com o primeiro domingo do ano.
    ///Pode receber qualquer dia da semana como entrada
    func weekNumberForSunday(for date: Date) -> Int? {
        var calendar = Calendar.current
        calendar.firstWeekday = 1 // Define o primeiro dia da semana como domingo
        
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)
        
        if let year = components.yearForWeekOfYear, let weekNumber = components.weekOfYear {
            return weekNumber
        }
        
        return nil
    }
    
    

}

#Preview {
    HomeViewController()
}
