//
//  TabBarController.swift
//  SnapChat
//
//  Created by Özcan on 2.08.2024.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = .red
        self.tabBar.unselectedItemTintColor = .green
        self.tabBar.barTintColor = .black
    }
    
    func setUpTabBars(vc:UIViewController) {
        
        
        // MARK: giving tabBars images and titles
        let firstVC = createNavCont(title: "Home", unselectedImage: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"), vc: FirstVC())
        let secondVC = createNavCont(title: "Social", unselectedImage: UIImage(systemName: "person.line.dotted.person"), selectedImage: UIImage(systemName: "person.line.dotted.person.fill"), vc: SecondVC())
        let thirdVC = createNavCont(title: "add", unselectedImage: UIImage(systemName: "video"), selectedImage: UIImage(systemName: "video.fill"), vc: ThirdVC())
        let fourthVC = createNavCont(title: "Search", unselectedImage: UIImage(systemName: "magnifyingglass.circle"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"), vc: FourthVC())
        let fifthVC = createNavCont(title: "Profile", unselectedImage: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"), vc: FifthVC())
        
        
        self.setViewControllers([firstVC,secondVC,thirdVC,fourthVC,fifthVC], animated: false)
        self.modalPresentationStyle = .fullScreen
        vc.present(self, animated: true)
    }
    
    private func createNavCont(title:String,unselectedImage: UIImage?, selectedImage: UIImage?, vc : UIViewController) -> UINavigationController {
        
        let navCont = UINavigationController(rootViewController: vc)
        
        navCont.tabBarItem = UITabBarItem(title: title, image: unselectedImage, selectedImage: selectedImage)
        
        return navCont
    }
    
}
