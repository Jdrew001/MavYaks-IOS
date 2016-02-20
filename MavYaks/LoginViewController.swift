//
//  LoginViewController.swift
//  MavYaks
//
//  Created by Drew on 2/13/16.
//  Copyright © 2016 dtatkison. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //IB OUTLETS, Variables, and Class declarations
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var emailErrorTxt: UILabel!
    @IBOutlet weak var passwordErrorTxt: UILabel!
    private var business = UserBusiness()
    private let viewControllerCustom = ViewControllerCustomizer()
    
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
        
//        viewControllerCustom.customNavBarLogin(self, width: self.view.frame.width, height: self.view.frame.height)
//        viewControllerCustom.customLoginViewController(self, width: self.view.frame.width, height: self.view.frame.height)
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        
    }
    
    @IBAction func returnToLoginScreen(segue: UIStoryboardSegue) {
        print(business.ref.authData)
        business.logoutUser()
    }
    
    override func viewDidAppear(animated: Bool) {
        viewControllerCustom.customNavBarLogin(self, width: self.view.frame.width, height: self.view.frame.height)
        viewControllerCustom.customLoginViewController(self, width: self.view.frame.width, height: self.view.frame.height)
        
        //Present the next view if a user has already been authenticated
        if business.authUser() == true {
            
            //Go to next view
            goToNextView()
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        viewControllerCustom.customNavBarLogin(self, width: self.view.frame.width, height: self.view.frame.height)
        viewControllerCustom.customLoginViewController(self, width: self.view.frame.width, height: self.view.frame.height)
    }
    
    override func viewDidDisappear(animated: Bool) {
        viewControllerCustom.customNavBarLogin(self, width: self.view.frame.width, height: self.view.frame.height)
        viewControllerCustom.customLoginViewController(self, width: self.view.frame.width, height: self.view.frame.height)
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
            business.loginUser(User(email: Email.text!, password: Password.text!, username: ""), viewController: self)
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
    * CREATE ALERT
    *
    * PARAMS: NONE
    *
    * DESCRIPTION:
    *   Create a message alert pop up when the user types in some invalid credentials.
    *   Message is based on the error!
    *
    */
    func createAlert(message: String) {
        
        let alert = UIAlertController(title: "ERROR", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "GOT IT", style: .Default, handler: {(action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: { (action) -> Void in
                
                self.Email.text = ""
                self.Password.text = ""
                
            })
            
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
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
        
        performSegueWithIdentifier("login-main", sender: self)
    }
    
}
