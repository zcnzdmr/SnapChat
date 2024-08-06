//
//  FifthVC.swift
//  SnapChat
//
//  Created by Özcan on 1.08.2024.
//

import UIKit

class FifthVC: UIViewController {
    
    let viewModel = FifthVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUIs()
    }
    
    
    private func setUpUIs() {
        let logOutButton = CustomButton(title: "Log Out", buttonType: .big, hasbackground: true)
        logOutButton.addTarget(self, action: #selector(didTapLogOutButton), for: .touchUpInside)
        
        let righBarButton = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(didTapRightBarButton))
        
        self.navigationItem.rightBarButtonItem = righBarButton
        self.navigationItem.rightBarButtonItem?.tintColor = .black
        
        view.addSubview(logOutButton)
        
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logOutButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logOutButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            logOutButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05),
            logOutButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6)
        ])
    }
    
    @objc func didTapRightBarButton() {
        print("tapped")
        
        self.navigationController?.pushViewController(SignInVC(), animated: true)
    }
    
    @objc func didTapLogOutButton() {
        print("Log Out")
        viewModel.logOutWithEmail { success, error in
            
            if success {
                
                DispatchQueue.main.async {
//                    self.modalPresentationStyle = .fullScreen
                    self.navigationController?.pushViewController(SignInVC(), animated: true)
                }
                
            }else{
                if let errorx = error {
                    
                    DispatchQueue.main.async {
                        AlertManager.showGeneralAlert(on: self, title: "An error occured", message: "\(errorx.localizedDescription)")
                        
                    }
                }
            }
        }
    }
}
