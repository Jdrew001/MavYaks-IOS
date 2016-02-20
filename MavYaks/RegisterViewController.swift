//
//  RegisterViewController.swift
//  MavYaks
//
//  Created by Drew on 2/13/16.
//  Copyright © 2016 dtatkison. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    //User Interface variables
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var usernameErrorLbl: UILabel!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var emailErrorLbl: UILabel!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var passwordErrorLbl: UILabel!
    @IBOutlet weak var confirmPassTxt: UITextField!
    @IBOutlet weak var confirmErrorLbl: UILabel!
    
    //Class declarations
    let business = UserBusiness()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeDetails()

        
    }

    @IBAction func registerBtnPressed(sender: AnyObject) {
        
        //Calling the authentication method
        authenticateUser()
        
    }
    
    /*
    * AUTHENTICATION OF THE USER
    *
    * PARAMS: none
    *
    * DESCRIPTION: 
    *   Take in all the user input and sort through it with another class
    *       if the user input is valid and no errors exist, then do TWO THINGS
    *       Pass all the data from the model and then pass it over to the back end business class and check
    *       if there is a user already with those credientials
    */
    func authenticateUser() {
        
        //Method variables
        let username = ValidateUITextField(textfield: usernameTxt)
        let email = ValidateUITextField(textfield: emailTxt)
        let password = ValidateUITextField(textfield: passwordTxt)
        let confirm = ValidateUITextField(textfield: confirmPassTxt)
        
        //Called when user presses the button
        if username.checkInput(usernameErrorLbl, message: "username")==true && email.checkInput(emailErrorLbl, message: "email") == true && password.checkInput(passwordErrorLbl, message: "password") == true && confirm.checkInput(confirmErrorLbl, message: "the same password") == true {
            
            //Check if the passwords match
            if password.checkPasswordMatch(confirmPassTxt, errorLbl: confirmErrorLbl) {
                
            //Pass the user object to the business class
            business.registerUser(User(email: emailTxt.text!, password: passwordTxt.text!, username: usernameTxt.text!), viewController: self)
            
                
            }
            
        }
        
    }
    
    /*
    * GO TO NEXT VIEW
    *
    * PARAMS: NONE*
    * 
    * DESCRIPTION: 
    *   Perform a segue to the next screen
    */
    func goToNextView() {
        self.navigationController?.popToRootViewControllerAnimated(false)
        performSegueWithIdentifier("Register-main", sender: self)
    }
    
    func createAlert(message: String) {
        
        let alert = UIAlertController(title: "ERROR", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "GOT IT", style: .Default, handler: {(action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: { (action) -> Void in
                
                self.usernameTxt.text = ""
                self.emailTxt.text = ""
                self.passwordTxt.text = ""
                self.confirmPassTxt.text = ""
                
            })
        
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    /*
    * SWIPE TO CLOSE
    *
    * PARAMS: UIGesture Recognizer -- Gesture
    *
    * DESCRIPTION:
    *   Method that is called when a swiping action is performed.
    *
    */
    func swipeToClose(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Down:
                
                //Dismiss the view
                self.dismissViewControllerAnimated(true, completion: nil)
            default:
                break;
            }
            
        }
        
    }
    
    /*
    * SWIPE DETAILS
    *
    * DESCRIPTION:
    *
    * Method holds the details of the swipe we want to detect
    *
    *
    */
    func swipeDetails() {
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: "swipeToClose:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
    }
    

}
