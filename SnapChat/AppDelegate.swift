//
//  AppDelegate.swift
//  SnapChat
//
//  Created by Özcan Özdemir on 28.07.2024.
//

import UIKit
import FirebaseCore
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        // MARK: 
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            
            if error != nil || user == nil {
                AlertManager.showGeneralAlert(on: SignUpVC(), title: "Something goes wrong", message: "\(error!.localizedDescription)")
            }else{
                let tabBar = TabBarController()
                tabBar.setUpTabBars(vc: SignUpVC())
            }
        }
        
            
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .systemBackground
        
        let signInVC = SignInVC()
        let nav = UINavigationController(rootViewController: signInVC)
        nav.modalPresentationStyle = .fullScreen
        
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func application(_ app: UIApplication,  // This code block is added to enable GoogleSignIn methods
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        
      return GIDSignIn.sharedInstance.handle(url)
    }
    
}
