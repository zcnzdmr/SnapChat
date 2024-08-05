//
//  FifthVC.swift
//  SnapChat
//
//  Created by Özcan on 1.08.2024.
//

import UIKit

class FifthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUIs()
    }
    

    private func setUpUIs() {
        let buton1 = CustomButton(title: "Deneme", buttonType: .big, hasbackground: true)
        
        let righBarButton = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(didTapRightBarButton))
        
        self.navigationItem.rightBarButtonItem?.tintColor = .red
        
        self.navigationItem.rightBarButtonItem = righBarButton
        
        view.addSubview(buton1)
        
        buton1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buton1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buton1.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    @objc func didTapRightBarButton() {
        print("tapped")
//        self.modalPresentationStyle = .fullScreen
//        self.present(SignInVC(), animated: false) {
//            print("navigating to SignInVC")
//        }
        
        self.navigationController?.pushViewController(SignInVC(), animated: true)
    }
}
