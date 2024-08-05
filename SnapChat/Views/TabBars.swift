////
////  TabBars.swift
////  SnapChat
////
////  Created by Özcan on 1.08.2024.
////
//
//import Foundation
//import UIKit
//
//
//class TabBars {
//    
//    
//    static func tabBarCont() -> UITabBarController {
//        
//        let tabbar = UITabBarController()
//        
//        
//        let firstVC = UINavigationController(rootViewController: FirstVC())
//        let secondVC = UINavigationController(rootViewController: SecondVC())
//        let thirdVC = UINavigationController(rootViewController: ThirdVC())
//        let fourthVC = UINavigationController(rootViewController: FourthVC())
//        let fifthVC = UINavigationController(rootViewController: FifthVC())
//        
//        firstVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"),selectedImage: UIImage(systemName: "house.fill"))
//        secondVC.tabBarItem = UITabBarItem(title: "Network", image: UIImage(systemName: "person.line.dotted.person"), selectedImage: UIImage(systemName: "person.line.dotted.person.fill"))
//        thirdVC.tabBarItem = UITabBarItem(title: "Add", image: UIImage(systemName: "video"), selectedImage: UIImage(systemName: "video.fill"))
//        fourthVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass.circle"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
//        fifthVC.tabBarItem = 
//        UITabBarItem(title: "Profile", image: UIImage(systemName: "person"),selectedImage: UIImage(systemName: "person.fill"))
//        
//        tabbar.tabBar.unselectedItemTintColor = .gray // specify unselected item color
//        tabbar.tabBar.tintColor = .white.withAlphaComponent(0.8 ) // specify selected tab Bar item color
//        
//        tabbar.selectedIndex = 2
//        
//        // FIXME: It doesnt work
////        tabbar.tabBar.barTintColor = .purple
//
////        
////        tabbar.viewControllers = [firstVC,secondVC,thirdVC,fourthVC,fifthVC]
////        tabbar.setViewControllers([firstVC,secondVC,thirdVC,fourthVC,fifthVC], animated: true)
//        return tabbar
//        
//    }
//}
//
//extension TabBars {
//    public static func tabBars(vc:UIViewController) {
//        
//        let tabBar = self.tabBarCont()
//        tabBar.modalPresentationStyle = .fullScreen
//        vc.present(tabBar, animated: true)
//    }
//}
//
