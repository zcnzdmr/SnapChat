//
//  AlertManager.swift
//  SnapChat
//
//  Created by Özcan on 31.07.2024.
//

import UIKit

class AlertManager {
    
    //    init(vc:UIViewController,title:String,message:String) {
    //        alertFonk(on: vc, title: title, message: message)
    //    }
    private static func alertFonk(on vc:UIViewController, title:String,message:String?) {
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
//            let action1 = UIAlertAction(title: "Error", style: .default) { x in
//                print("action1 selected")
//            }
//            alert.addAction(action1)
            
            let action2 = UIAlertAction(title: "Dismiss", style: .destructive) { UIAlertAction in
                print("dismiss selected")
            }
            
            alert.addAction(action2)
            
            vc.present(alert, animated: true)
        }
    }
}


extension AlertManager {
    
    // MARK: Validation Errors
    public static func showInvalidEmailAlert(vc:UIViewController) {
        
        alertFonk(on: vc, title: "Invalid Email", message: "Please enter a valid email")
    }
    
    public static func showInvalidPasswordAlert(vc:UIViewController) {
        
        alertFonk(on: vc, title: "Invalid Password", message: "Please enter a valid password")
    }
    
    public static func showRandomAlert(vc:UIViewController) {
        
        alertFonk(on: vc, title: "Unexpected error", message: "Please enter a valid username")
    }
    
}

// MARK: Registration Errors
extension AlertManager {
    
    public static func showRegistrationError(vc: UIViewController, error: Error) {
        alertFonk(on: vc, title: "Unknown Registration Error", message:"\(error.localizedDescription)" )
    }
    
    public static func showRegistrationErrorMessage(vc:UIViewController, error: Error) {
        alertFonk(on: vc, title: "Registration error", message: "\(error.localizedDescription)")
    }
}

// MARK: Log In Errors
extension AlertManager {
    
    public static func showSingInError(vc: UIViewController,error: Error) {
        alertFonk(on: vc, title: "Sign In Error", message: "\(error.localizedDescription)")
    }
    
    public static func showSingInError(vc: UIViewController) {
        alertFonk(on: vc, title: "Unknown Sign In Error", message: nil)
    }
    
}

// MARK: Log Out Errors
extension AlertManager {
    
    public static func showLogOutError(vc: UIViewController,error: Error) {
        alertFonk(on: vc, title: "Log Out Error", message: "\(error.localizedDescription)")
    }
    
    public static func showLogOutError(vc: UIViewController) {
        alertFonk(on: vc, title: "Unknown Log out Error", message: nil)
    }
}


// MARK: Forgot Password
extension AlertManager {
    
    
    public static func showPasswordResetSent(vc: UIViewController) {
        alertFonk(on: vc, title: "Password Reset Request sent", message: nil)
    }
    
    public static func showErrorSendingPasswordReset(vc: UIViewController,error:Error) {
        alertFonk(on: vc, title: "Error Sending Password Reset", message: "\(error.localizedDescription)")
    }
    
}

// MARK: Fetching user error
extension AlertManager {
    
    public static func showFetchingUserError(vc: UIViewController,error:Error) {
        alertFonk(on: vc, title: "Error fetching users", message: "\(error.localizedDescription)")
    }
    
    public static func showFetchingUserError(vc: UIViewController) {
        alertFonk(on: vc, title: "Unknown fetching user error", message: nil)
    }
}

// MARK: Empty or Nil error
extension AlertManager {
    
    public static func showEmptyEmailError(vc: UIViewController) {
        alertFonk(on: vc, title: "Email can't be empty", message: nil)
    }
    
    public static func showEmptyPasswordError(vc: UIViewController) {
        alertFonk(on: vc, title: "Password can't be empty", message: nil)
    }
    
    public static func showEmptyUsernameError(vc: UIViewController) {
        alertFonk(on: vc, title: "Username can't be empty", message: nil)
    }
}

