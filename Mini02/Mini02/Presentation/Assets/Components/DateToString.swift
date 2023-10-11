//
//  DateFormatter.swift
//  Mini02
//
//  Created by Luca Lacerda on 29/09/23.
//

import Foundation

class DateToString{
    
    var date: String?
    let DeLabel = Label(localizedTextKey: "de")
    func makeDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        let dateFormatted = formatter.string(from: date)
  
        let dateArr = dateFormatted.components(separatedBy: "/")
        let day = dateArr[0]
        var month = dateArr[1]
        month = self.returnMonth(month: month)
        let finalDate = day + " \(DeLabel.text ?? "not identified") " + month
        return finalDate
    }
    
    private func returnMonth(month: String) -> String {
        if let monthInt = Int(month) {
            switch monthInt {
            case 1:
                return Label(localizedTextKey: "Janeiro").text ?? "not identified"
            case 2:
                return Label(localizedTextKey: "Fevereiro").text ?? "not identified"
            case 3:
                return Label(localizedTextKey: "Março").text ?? "not identified"
            case 4:
                return Label(localizedTextKey: "Abril").text ?? "not identified"
            case 5:
                return Label(localizedTextKey: "Maio").text ?? "not identified"
            case 6:
                return Label(localizedTextKey: "Junho").text ?? "not identified"
            case 7:
                return Label(localizedTextKey: "Julho").text ?? "not identified"
            case 8:
                return Label(localizedTextKey: "Agosto").text ?? "not identified"
            case 9:
                return Label(localizedTextKey: "Setembro").text ?? "not identified"
            case 10:
                return Label(localizedTextKey: "Outubro").text ?? "not identified"
            case 11:
                return Label(localizedTextKey: "Novembro").text ?? "not identified"
            case 12:
                return Label(localizedTextKey: "Dezembro").text ?? "not identified"
            default:
                return "not identified"
            }
        } else {
            return "not identified"
        }
    }

    
}
