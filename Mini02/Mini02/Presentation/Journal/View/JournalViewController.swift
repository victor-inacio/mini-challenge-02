//
//  JournalViewController.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

import UIKit

class JournalViewController: UIViewController, MVVMCView {

    var modelView: JournalViewModel!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .green
        
        title = "Journal"
    }
}
