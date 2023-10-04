//
//  TestViewController.swift
//  Mini02
//
//  Created by Luca Lacerda on 27/09/23.
//

import UIKit

class CallendarPickerViewModal: UIViewController {

    var delegate: dateModalDelegate?
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        
        setupCalendar()
    }

    private func setupCalendar(){
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.addTarget(self, action: #selector(sendDate), for: .valueChanged)
        self.view.addSubview(datePicker)
        
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: self.view.topAnchor),
            datePicker.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            datePicker.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            datePicker.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }
    
    @objc func sendDate(){
        delegate?.datePass(date: datePicker.date)
    }
}
