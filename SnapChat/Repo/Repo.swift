import Foundation
import FirebaseAuth
import GoogleSignIn
import FirebaseCore

class Repo {
    
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
    
    func signInWithEmail(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }
    
    
    // MARK: Google Sign up part
    func googleSignIn(completion: @escaping (Bool, Error?) -> Void) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        
//        guard let presentingVC = SignUpVC() else{ completion(false,NSError(domain: <#T##String#>, code: <#T##Int#>, userInfo: <#T##[String : Any]?#>))}
        
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
}

