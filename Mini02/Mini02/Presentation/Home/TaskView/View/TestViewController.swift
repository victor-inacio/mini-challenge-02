//
//  TestViewController.swift
//  Mini02
//
//  Created by Luca Lacerda on 27/09/23.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCalendar()
    }

    private func setupCalendar(){
        let calendar = UICalendarView()
        calendar.calendar = .autoupdatingCurrent
        calendar.fontDesign = .rounded
        self.view.addSubview(calendar)
        
}
    
}
