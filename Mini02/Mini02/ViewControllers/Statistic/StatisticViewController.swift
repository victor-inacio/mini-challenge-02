//
//  StatisticView.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

import UIKit

class StatisticViewController: UIViewController {
    
    private var table: UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
    }

}
