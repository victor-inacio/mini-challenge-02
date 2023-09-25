//
//  StatisticView.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

import UIKit

class StatisticViewController: UIViewController, MVVMCView {

    var modelView: StatisticsViewModel!
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        
        
        title = "Statistics"
    }

}
