//
//  ThirdVC.swift
//  SnapChat
//
//  Created by Özcan on 1.08.2024.
//

import UIKit

class ThirdVC: UIViewController {
    
    
// MARK: UI Components
    
    var myImage : UIImageView = {
        var iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.borderWidth = 1
        iv.image = UIImage(named: "arkaplan")
        iv.isUserInteractionEnabled = true

        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIs()

        view.backgroundColor = .secondarySystemBackground
        gestureRec()
        self.navigationItem.title = "Upload Page"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black,
                                                                        .font: UIFont(name: "Papyrus", size: 20)!]
    }
    
    func gestureRec() {
        let gR = UITapGestureRecognizer(target: self, action: #selector(showImagePickerController))
        myImage.addGestureRecognizer(gR)
    }

    
    private func setUpUIs() {
        
        self.view.addSubview(myImage)
        
        
        myImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            myImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            myImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            myImage.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.6),
            myImage.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        
        ])
        
    }

}

// MARK: Picking Up photos from gallery
extension ThirdVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @objc func showImagePickerController() {
        let imagePickerCont = UIImagePickerController()
        imagePickerCont.delegate = self
        imagePickerCont.allowsEditing = true
        present(imagePickerCont, animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[.editedImage] as? UIImage {
            myImage.image = editedImage
        }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            myImage.image = originalImage
        }else{
            AlertManager.showGeneralAlert(on: self, title: "Something went wrong", message: "Try again")
        }
        dismiss(animated: true)
    }
    
}
