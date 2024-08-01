//
//  Repo.swift
//  SnapChat
//
//  Created by Özcan on 1.08.2024.
//

import Foundation
import FirebaseAuth


class Repo {
    
    
    func signUpWithEmail(email:String, username:String, password: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { authdataresult, error in
            
            if error != nil {
                AlertManager.showRegistrationErrorMessage(vc: SignUpVC(), error: error!)
            }else {
                
            }
            
        }
        
    }
    
}
