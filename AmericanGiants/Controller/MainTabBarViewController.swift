//
//  ViewController.swift
//  AmericanGiants
//
//  Created by Ezhilarasi on 04/05/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemPink
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: CartViewController())
        let vc3 = UINavigationController(rootViewController: UserViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.tabBarItem.title = "Home"
        vc2.tabBarItem.image = UIImage(systemName: "cart")
        vc2.tabBarItem.title = "Cart"
        vc3.tabBarItem.image = UIImage(systemName: "person.circle")
        vc3.tabBarItem.title = "Account"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1,vc2,vc3], animated: true)
    }


}

