//
//  AppDelegate.swift
//  SnapChat
//
//  Created by Özcan Özdemir on 28.07.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .systemBackground
        
        let firstVC = SignInVC()
        let nav = UINavigationController(rootViewController: firstVC)
        nav.modalPresentationStyle = .fullScreen
        
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }
    
}
