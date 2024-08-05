//
//  SignInVM.swift
//  SnapChat
//
//  Created by Özcan on 5.08.2024.
//

import Foundation


class SignInVM {
    
    private let repo = Repo()
    
    
    func signInWithEmail(email:String, password:String, completion: @escaping (Bool,Error?) -> Void) {
        repo.signInWithEmail(email: email, password: password, completion: completion)
    }
}
