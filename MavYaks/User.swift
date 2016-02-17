//
//  User.swift
//  MavYaks
//
//  Created by Drew on 2/13/16.
//  Copyright © 2016 dtatkison. All rights reserved.
//

import Foundation
import Firebase



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
    
    /*init?(authData: FAuthData) {
        
        //uid = authData.uid
        email = authData.providerData["email"] as! String
        password = authData.providerData["password"] as! String
        
        if email.isEmpty || password.isEmpty {
            return nil
        }
        
    }*/
    
    init( email: String, password: String, username: String) {
        self.email = email
        self.username = username
        self.password = password
        
    }
    
    func getEmail() -> String {
        return self.email
    }
    
    func getPassword() -> String {
        return self.password
    }
    
    func getUsername() -> String {
        return self.username
    }
    
    
}