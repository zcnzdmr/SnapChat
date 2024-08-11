//
//  ThirdVC.swift
//  SnapChat
//
//  Created by Özcan on 1.08.2024.
//

import UIKit

class ThirdVC: UIViewController {
    
    let upLoadButton = CustomButton(title: "Upload Image", buttonType: .medium, hasbackground: true)
    private let viewModel = ThirdVCVM()
    var boolForButton = false
    
    
    // MARK: UI Components
    let myImage : UIImageView = {
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
        configureGestures()
        
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "Upload Page"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black,
                                                                        .font: UIFont(name: "Papyrus", size: 20)!]
    }
    
    private func configureGestures() {
        let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(showImagePickerController))
        myImage.addGestureRecognizer(imageTapGesture)
        upLoadButton.addTarget(self, action: #selector(didTapUploadButton), for: .touchUpInside)
    }
    
    // MARK: Sending out images from photo gallery to upload in FireBase Storage
    @objc func didTapUploadButton() {
        
        if boolForButton == true {
            
            if let imageData = myImage.image?.pngData() {
                
                viewModel.FireBaseStorageImageSaving(data: imageData,completion: { success, error in
                    
                    if success {
                        
                        self.boolForButton.toggle()
                        print("image uploaded")
                        
                    }else{
                        
                        AlertManager.showGeneralAlert(on: self, title: "Error", message: error?.localizedDescription)
                    }
                })
            }else{
                AlertManager.showGeneralAlert(on: self, title: "Error", message: "While converting image error occured")
            }
        }
    }
    
    private func setUpUIs() {
        
        self.view.addSubview(myImage)
        self.view.addSubview(upLoadButton)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        
        myImage.translatesAutoresizingMaskIntoConstraints = false
        upLoadButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            myImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            myImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            myImage.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.6),
            myImage.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            
            upLoadButton.topAnchor.constraint(equalTo: self.myImage.bottomAnchor, constant: 50),
            upLoadButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            upLoadButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.06),
            upLoadButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6),
            
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
        
        if let selectedImage = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
            myImage.image = selectedImage
            boolForButton = true
        } else {
            AlertManager.showGeneralAlert(on: self, title: "Error", message: "Failed to select an image.")
        }
        
        dismiss(animated: true)
    }
}
