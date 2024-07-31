//
//  AppDelegate.swift
//  SnapChat
//
//  Created by Özcan Özdemir on 28.07.2024.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
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
