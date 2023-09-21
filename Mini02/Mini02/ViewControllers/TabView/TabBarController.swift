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

        setup()
    }
    
    func setup(){
        let vc1 = HomeViewController()
        let vc2 = StatisticViewController()
        let vc3 = JournalViewController()
        
        vc1.tabBarItem.title = "Home"
        vc1.tabBarItem.image = UIImage(systemName: "gear")
        let nav1 = UINavigationController(rootViewController: vc1)
        
        vc2.tabBarItem.title = "Journal"
        vc2.tabBarItem.image = UIImage(systemName: "pencil")
        let nav2 = UINavigationController(rootViewController: vc2)
        
        vc3.tabBarItem.title = "Statistic"
        vc3.tabBarItem.image = UIImage(systemName: "star.fill")
        let nav3 = UINavigationController(rootViewController: vc3)
        
        tabBar.backgroundColor = .systemGray
        tabBar.tintColor = .label
        
        setViewControllers([nav1,nav2,nav3], animated: true)
    }
    
}
