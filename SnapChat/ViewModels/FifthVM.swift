//
//  FifthVM.swift
//  SnapChat
//
//  Created by Özcan on 6.08.2024.
//

import Foundation

class FifthVM {
    
    private let repo = Repo()
    
    func logOutWithEmail(completion:(Bool,Error?) -> Void) {
        repo.logOutWithEmail(completion: completion)
    }
}
