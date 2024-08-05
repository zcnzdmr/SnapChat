//
//  SignUpVM.swift
//  SnapChat
//
//  Created by Özcan on 1.08.2024.
//

import Foundation


class SignUpVM {
    
    private let repo = Repo()
    
    
    func signUpWithEmail(email:String, username:String, password: String, completion: @escaping (Bool,Error?) -> Void) {
        
        repo.signUpWithEmail(email: email, username: username, password: password, completion:  completion)
    }
    
    func googleSingIn(completion: @escaping (Bool,Error?) -> Void) {
        repo.googleSingIn(completion: completion)
    }
}

