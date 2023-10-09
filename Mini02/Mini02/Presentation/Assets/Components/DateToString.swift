//
//  DateFormatter.swift
//  Mini02
//
//  Created by Luca Lacerda on 29/09/23.
//

import Foundation

class DateToString{
    
    var date: String?
    
    func makeDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        let dateFormatted = formatter.string(from: date)
  
        let dateArr = dateFormatted.components(separatedBy: "/")
        let day = dateArr[0]
        var month = dateArr[1]
        month = self.returnMonth(month: month)
        let finalDate = day + " de " + month
        return finalDate
    }
    
    private func returnMonth(month: String) -> String {
        if let monthInt = Int(month) {
            switch monthInt{
            case 1:
                return "Janeiro"
            case 2:
                return "Fevereiro"
            case 3:
                return "Março"
            case 4:
                return "Abril"
            case 5:
                return "Maio"
            case 6:
                return "Junho"
            case 7:
                return "Junho"
            case 8:
                return "Agosto"
            case 9:
                return "Setembro"
            case 10:
                return "Outubro"
            case 11:
                return "Novembro"
            case 12:
                return "Dezembro"
            default:
                return "not identified"
            }
        }else {
            return "not identified"
        }
    }
    
}
