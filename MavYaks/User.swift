//
//  User.swift
//  MavYaks
//
//  Created by Drew on 2/13/16.
//  Copyright © 2016 dtatkison. All rights reserved.
//

import Foundation
import Firebase
import UIKit

/*
* User model
*
* PROPERTIES
* Userid, email, and password
*
* INITILIZE
* both the FIREBASE auth and arbitrary data
*
*/
class User {
    
    //Properties
    //private let uid: String
    private let email: String
    private let username: String
    private let password: String
    
    init(email: String, password: String, username: String) {
        self.email = email
        self.username = username
        self.password = password
        
    }
    
    init?(authData: FAuthData) {
        
        //uid = authData.uid
        email = authData.providerData["email"] as! String
        password = authData.providerData["password"] as! String
        self.username = ""
        
        if email.isEmpty || password.isEmpty {
            return nil
        }
        
    }
    
    /*
    * GET EMAIL
    *
    * RETURNS: String
    *
    * DESCRIPTION: Getter returning a string...The user's email that has been entered
    */
    func getEmail() -> String {
        return self.email
    }
    
    /*
    * GET PASSWORD
    *
    * RETURNS: String
    *
    * DESCRIPTION: Getter returning a string...The user's password that has been entered
    */
    func getPassword() -> String {
        return self.password
    }
    
    /*
    * GET USERNAME
    *
    * RETURNS: String
    *
    * DESCRIPTION: Getter returning a string...The user's username that has been entered
    */
    func getUsername() -> String {
        return self.username
    }
    
    
}