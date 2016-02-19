//
//  UserBusiness.swift
//  MavYaks
//
//  Created by Drew on 2/13/16.
//  Copyright © 2016 dtatkison. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class UserBusiness {
    
    let ref = Firebase(url: "https://mavyak.firebaseio.com");
    
    init() {
        
    }
    
    /*
    * REGISTER USER
    *
    * PARAMS: User object, and Register View Controller
    *
    * RETURNS: NIL
    *
    * DESCRIPTION:
    *   Method registers a user with the user's email and password
    *       Also, if there is an error then show a view in the 
    *       registerviewcontroller display the specific error
    */
    func registerUser(user: User, viewController: RegisterViewController) {
        
        ref.createUser(user.getEmail(), password: user.getPassword(),
            withValueCompletionBlock: { error, result in
                if error != nil {
                    // There was an error creating the account
                    print(error)
                    
                    if let errorCode = FAuthenticationError(rawValue: error.code) {
                        switch (errorCode) {
                        case .EmailTaken:
                            viewController.createAlert("Email is already been taken")
                        case .NetworkError:
                            viewController.createAlert("Something is wrong with your connection")
                        case .Unknown:
                            viewController.createAlert("Something UNKNOWN happen. Try again soon")
                        default:
                            viewController.createAlert("OOPS something went wrong")
                        }
                    }
                    
                } else {
                    let uid = result["uid"] as? String
                    print("Successfully created user account with uid: \(uid)")
                    viewController.goToNextView()
                }
        })
        
    }
    
    /*
    * LOGIN USER
    *
    * PARAMS: user object, and LoginViewController
    *
    * Method logs people into the application if all potential errors do not exist
    * and then go to the main application
    */
    func loginUser(user: User, viewController: LoginViewController) {
        
        ref.authUser(user.getEmail(), password: user.getPassword(),
            withCompletionBlock: { error, authData in
                if error != nil {
                    // There was an error logging in to this account
                    if let errorCode = FAuthenticationError(rawValue: error.code) {
                        switch(errorCode) {
                        case .InvalidArguments:
                            viewController.createAlert("Something is wrong with your email or password")
                        case .InvalidEmail:
                            viewController.createAlert("You have entered an invalid email address")
                        case .InvalidPassword:
                            viewController.createAlert("You have entered in the wrong password")
                        case .NetworkError:
                            viewController.createAlert("OOPS you have a network error. Try again with a better connection")
                        case .UserDoesNotExist:
                            viewController.createAlert("The current user does not exsist")
                        case .Unknown:
                            viewController.createAlert("OOPS an error occurred")
                        default:
                            viewController.createAlert("Something went wrong")
                            break;
                        }
                    }
                    
                } else {
                    // We are now logged in
                    viewController.goToNextView()
                    
                }
        })
        
    }
    
    /*
    * AUTHUSER
    *
    * PARAMS: NONE
    *
    * RETURNS Boolean
    *
    * DESCRIPTION: 
    *
    *   Method checks to see if a session/User is logged in on their device and if true then
    *   the method returns true otherwise it returns false
    */
    func authUser() -> Bool {
        
        if ref.authData != nil {
            return true
        } else {
            return false
        }
        
    }
    
    /*
    * LOGOUT USER
    *
    * DESCRIPTION:
    *   Method logs user out of the application
    */
    func logoutUser() {
        ref.unauth()
    }
    
    
}
