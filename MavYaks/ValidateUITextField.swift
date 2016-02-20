//
//  ValidateUITextField.swift
//  MavYaks
//
//  Created by Drew on 2/13/16.
//  Copyright © 2016 dtatkison. All rights reserved.
//

import UIKit

class ValidateUITextField: NSObject {
    
    //variables
    private let textfield: UITextField!
    
    //Initilizer
    init(textfield: UITextField) {
            
        self.textfield = textfield
            
    }
    /*
    *First we want to see if it is empty and then based on that change the properties
    *
    *PROPERTIES
    *
    *Border Width
    *Border Color
    *Corner Radius
    */
        
    func checkInput(errorLabel: UILabel, message: String) -> Bool {
            
        if textfield.text == "" {
                
            textfield.layer.borderColor = UIColor.redColor().CGColor
            textfield.layer.borderWidth = 2
            textfield.layer.cornerRadius = 5.0
            errorLabel.text = "Enter your \(message)"
            errorLabel.textColor = UIColor.whiteColor()
                
            return false
                
                
        } else {
            textfield.layer.borderWidth = 0
            textfield.layer.borderColor = UIColor.grayColor().CGColor
            errorLabel.text = ""
                
            return true
        }
            
    }
    
    /*
    * CHECK PASSWORD MATCH
    * PARAMS: confirm password textfield, and an error label to display the error message
    *
    * DESCRIPTION: 
    *   Method takes the params and checks to see if the password textfield and confirm match
    *       if they do then return true 
    *       otherwise return false and show the following information
    */
    func checkPasswordMatch(confirmPassword: UITextField, errorLbl: UILabel) -> Bool {
        
        if textfield.text == confirmPassword.text {
            return true
        } else {
            
            //Change the appearance of both the password textfield and confirm password textfield
            textfield.layer.borderColor = UIColor.redColor().CGColor
            textfield.layer.borderWidth = 1
            textfield.layer.cornerRadius = 5.0
            confirmPassword.layer.borderColor = UIColor.redColor().CGColor
            confirmPassword.layer.borderWidth = 1
            confirmPassword.layer.cornerRadius = 5.0
            errorLbl.text = "*****your passwords do not match"
            errorLbl.textColor = UIColor.redColor()
            
            return false
        }
        
    }

}
