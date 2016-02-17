//
//  LoginViewController.swift
//  MavYaks
//
//  Created by Drew on 2/13/16.
//  Copyright © 2016 dtatkison. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var emailErrorTxt: UILabel!
    @IBOutlet weak var passwordErrorTxt: UILabel!
    var business = UserBusiness()
    
    
    /*
    *
    * Called when the view loads and performs the following code
    * 
    *
    *
    */
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailErrorTxt.text = ""
        passwordErrorTxt.text = ""
        
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    * Login button event listener
    * PRESSED:
    * Run the validated code and return true or false
    * returned TRUE call a method that goes to FIREBASE and authenticate user
    *
    * Will add a loading notification that tells the user that it is loading
    *
    * Eventually will add that
    */
    @IBAction func loginBtnPressed(sender: AnyObject) {
        
            
        //METHOD: authenticateUser()
        authenticateUser()
    }
    
    /*
    * AUTHENTICATION OF THE USER
    *
    * PARAMS: NONE
    *
    * DESCRIPTION
    */
    func authenticateUser() {
        
        let emailText = ValidateUITextField(textfield: Email)
        let passwordText = ValidateUITextField(textfield: Password)
        
        
        
        if(emailText.checkInput(emailErrorTxt, message: "email") == true && passwordText.checkInput(passwordErrorTxt, message: "password") == true){
            
            print("WORKED!!!!")
            
            
            //Call a method that takes the email and password and gives it to the model
            business.loginUser(User(email: Email.text!, password: Password.text!, username: ""))
            performSegueWithIdentifier("login-main", sender: nil)
        }         
    }
    
    
    /*
    *
    * When dismisses the keyboard when the user taps the screen
    *
    */
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
