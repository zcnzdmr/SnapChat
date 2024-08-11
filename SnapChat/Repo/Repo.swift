import Foundation
import FirebaseAuth
import GoogleSignIn
import FirebaseCore
import WebKit
import FBSDKLoginKit
import FBSDKCoreKit
import FirebaseFirestore
import FirebaseStorage

class Repo {
    
    init() {
        
    }
    
    // MARK: SignUp with email
    func signUpWithEmail(email: String, username: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }
    
    
    // MARK: SignIn with email
    func signInWithEmail(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }
    
    func logOutWithEmail(completion:(Bool,Error?) -> Void) {
        
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            completion(true,nil)
        } catch let signOutError as NSError {
            completion(false,signOutError)
            print("Error signing out: %@", signOutError)
        }
    }
    
    
    // MARK: Google Sign up part
    func googleSignIn(completion: @escaping (Bool, Error?) -> Void) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // this was the code that rescue the application after adding Google SignIn method
        guard let presentingVC = UIApplication.shared.windows.first?.rootViewController else {
            completion(false, NSError(domain: "GoogleSignInError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Presenting View Controller not found"]))
            return
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingVC) { result, error in
            if let error = error {
                print("Google Sign-In Error: \(error.localizedDescription)")
                completion(false, error)
                return
            }
            
            let accessToken = result!.user.accessToken.tokenString
            
            guard let user = result?.user, let idToken = user.idToken?.tokenString else {
                completion(false, NSError(domain: "GoogleSignInError", code: -2, userInfo: [NSLocalizedDescriptionKey: "Failed to get user or token"]))
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    completion(false, error)
                } else {
                    completion(true, nil)
                }
            }
        }
    }
    
    
    func faceBookSignIn(completion: @escaping (Bool,Error?) -> Void) {
        
        //        if let token = AccessToken.current,
        //            !token.isExpired {
        //            completion(true,nil)
        //            // User is logged in, do work such as go to next view controller.
        //        }else{
        //
        //        }
    }
    
    
    func FireBaseStorageImageSaving(data: Data,completion: @escaping (Bool,Error?) -> Void) {
        
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let imageUUID = UUID().uuidString
        
        var imageReference = storageRef.child("images/\(imageUUID).jpg")
        
        imageReference.putData(data, metadata: nil) { (storageMetaData, error) in
            
            if error != nil {
                
                completion(false,error)
                
            }else{
                
                imageReference.downloadURL { url, error in
                    
                    if error != nil {
                        completion(false,error)
                    }else {
                        completion(true,nil)
                        let urlOfImage = url
                        print(url!)
                    }
                }
            }
        }
    }
}

