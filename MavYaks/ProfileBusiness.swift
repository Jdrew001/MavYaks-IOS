//
//  ProfileBusiness.swift
//  MavYaks
//
//  Created by Drew on 2/19/16.
//  Copyright © 2016 dtatkison. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class ProfileBusiness {
    
    //Variables and Class declarations
    private let ref = Firebase(url: "https://mavyak.firebaseio.com/users");
    
    init() {
        
    }
    
    func saveUserProfile(userProfile: UserProfile) {
        
        if ref.authData != nil {
            // user authenticated
            print(ref.authData)
        } else {
            // No user is signed in
        }
        
        
        
    }

}
