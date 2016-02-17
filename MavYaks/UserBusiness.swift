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
    
    func loginUser(user: User) {
        
        print(user.getEmail())
        print(user.getPassword())
        
    }
    
    
}
