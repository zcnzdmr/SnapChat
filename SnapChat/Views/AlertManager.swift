//
//  AlertManager.swift
//  SnapChat
//
//  Created by Özcan on 31.07.2024.
//

import UIKit

class AlertManager {
    
    
    init(vc:UIViewController,title:String,message:String) {
        alertFonk(on: vc, title: title, message: message)
    }
    
    func alertFonk(on vc:UIViewController, title:String,message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Error", style: .default) { x in
            print("action1 selected")  
        }
        alert.addAction(action1)
        
        let action2 = UIAlertAction(title: "Dismiss", style: .destructive) { UIAlertAction in
            print("dismiss selected")
        }
                                    
        alert.addAction(action2)
        
        vc.present(alert, animated: true)
        
    }

}

