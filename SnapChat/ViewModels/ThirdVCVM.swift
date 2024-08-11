//
//  ThirdVCVM.swift
//  SnapChat
//
//  Created by Özcan Özdemir on 11.08.2024.
//

import Foundation


class ThirdVCVM {
    private let repo = Repo()
    
    func FireBaseStorageImageSaving(data: Data,completion: @escaping (Bool,Error?) -> Void) {
        repo.FireBaseStorageImageSaving(data: data, completion: completion)
    }
    
}
