//
//  FirstVC.swift
//  SnapChat
//
//  Created by Özcan on 1.08.2024.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        self.tabBarController?.tabBar.backgroundColor = .black.withAlphaComponent(0.8) // determines the background color of tabBar
    }
    
    private func setUpUIs() {
        
    }
}
