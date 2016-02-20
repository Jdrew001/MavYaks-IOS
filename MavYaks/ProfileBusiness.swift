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
    private var base64String: NSString = ""
    
    init() {
        
    }
    
    func saveUserProfile(userProfile: UserProfile) {
        
        if ref.authData != nil {
            // user authenticated
            print(ref.authData)
            
            /*
                Convert photo into a base64 string
                then who ever is authenticated, we want to pass these objects to them!
            */
            
            let imageData: NSData = UIImageJPEGRepresentation(userProfile.getImage(), 0.1)!
            self.base64String = imageData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
            
            let newProfileSettings = [
                "firstname": userProfile.getFirstName(),
                "lastname": userProfile.getLastName(),
                "profileImage" : self.base64String
            ]
            
            ref.childByAppendingPath(ref.authData.uid).updateChildValues(newProfileSettings)
            
        }
        
    }

}














