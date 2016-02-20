//
//  UserProfile.swift
//  MavYaks
//
//  Created by Drew on 2/16/16.
//  Copyright © 2016 dtatkison. All rights reserved.
//

import Foundation
import UIKit

class UserProfile {

    private let image: UIImage
    private let firstName: String
    private let lastName: String
    
    
    init(image: UIImage, firstName: String, lastName: String) {
        self.image = image
        self.firstName = firstName;
        self.lastName = lastName;
    }
    
    func getImage() -> UIImage {
        return image
    }
    
    func getFirstName() -> String {
        return firstName
    }
    
    func getLastName() -> String {
        return lastName
    }
    
    
}
