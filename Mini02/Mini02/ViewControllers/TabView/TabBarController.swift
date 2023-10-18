//
//  TabBarController.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

import UIKit

class TabBarController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setup() {
        let vc1 = HomeViewController()
        let vc2 = StatisticViewController()
        let vc3 = JournalViewController()
        let titletab1 = Label(localizedTextKey: "Tarefas")
        let titletab2 = Label(localizedTextKey: "Diário")
        let titletab3 = Label(localizedTextKey: "Estatísticas")

        
        vc1.tabBarItem.title = "\(titletab1.text ?? "not identified")"
        vc1.tabBarItem.image = UIImage(systemName: "list.bullet.rectangle.portrait")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "list.bullet.rectangle.portrait.fill")
        let nav1 = UINavigationController(rootViewController: vc1)
        
        vc2.tabBarItem.title = "\(titletab2.text ?? "not identified")"
        vc2.tabBarItem.image = UIImage(systemName: "pencil.circle")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "pencil.circle.fill")
        let nav2 = UINavigationController(rootViewController: vc2)
        
        vc3.tabBarItem.title = "\(titletab3.text ?? "not identified")"
        vc3.tabBarItem.image = UIImage(systemName: "chart.bar")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "chart.bar.fill")
        let nav3 = UINavigationController(rootViewController: vc3)
        
        tabBar.backgroundColor = .systemGray
        tabBar.tintColor = .label
        
        setViewControllers([nav1, nav2, nav3], animated: true)
    }

}

