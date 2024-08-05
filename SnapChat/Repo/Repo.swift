//
//  Repo.swift
//  SnapChat
//
//  Created by Özcan on 1.08.2024.
//

import Foundation
import FirebaseAuth


class Repo {
    
    func signUpWithEmail(email:String, username:String, password: String, completion: @escaping (Bool,Error?) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { authdataresult, error in
            
            if let error = error {
                
                completion(false,error)
                
            }else{
                
                completion(true,nil)
                
            }
        }
    }

    
    func signInWithEmail(email:String, password:String, completion: @escaping (Bool,Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authresult, error) in
            
            if let error = error {
                
                completion(false,error)
                
            }else {
                
                completion(true,nil)
            }
        }
    }
}
