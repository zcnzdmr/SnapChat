//
//  Repo.swift
//  SnapChat
//
//  Created by Özcan on 1.08.2024.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import FirebaseCore


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
    
    
    
    func googleSingIn(completion: @escaping (Bool,Error?) -> Void) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: SignInVC()) { result, error in
            
            if error == nil {
                
                completion(true,nil)
                guard let user = result?.user, let idToken = user.idToken?.tokenString else {
                    // ...
                    return completion(false,error)
                }
                
                let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                               accessToken: user.accessToken.tokenString)
                
                // ...
                
            }
        }
    }
}
