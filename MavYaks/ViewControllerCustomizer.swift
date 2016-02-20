//
//  NavBarCustomizer.swift
//  MavYaks
//
//  Created by Drew on 2/20/16.
//  Copyright © 2016 dtatkison. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerCustomizer {
    
    let colorTop = UIColor(red: 245.0/255.0, green: 128.0/255.0, blue: 36.0/255.0, alpha: 1.0).CGColor
    let colorBottom = UIColor(red: 240.0/255.0, green: 149.0/255.0, blue: 77.0/255.0, alpha: 1.0).CGColor
    let blueColor = UIColor(red: 26/255, green: 101/255, blue: 177/255, alpha: 1)
    
    
    let gl :CAGradientLayer
    
    init() {
        
        gl = CAGradientLayer()
        
    }
    
    func customNavBarLogin(viewController: LoginViewController, width: CGFloat, height: CGFloat) {
//        var nav = self.navigationController?.navigationBar
//        // 2
//        nav?.barStyle = UIBarStyle.Black
//        nav?.tintColor = UIColor.yellowColor()
//        // 3
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
//        imageView.contentMode = .ScaleAspectFit
//        // 4
//        let image = UIImage(named: "Apple_Swift_Logo")
//        imageView.image = image
//        // 5
//        navigationItem.titleView = imageView
        
        let nav = viewController.navigationController?.navigationBar
        
        //Change the style of the bar
        nav?.barTintColor = UIColor(red: 26/255, green: 101/255, blue: 177/255, alpha: 1)
        nav?.barStyle = UIBarStyle.Black
        //self.navigationController.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "CaviarDreams", size: 20)!]
        viewController.title = "MAVYAKS"
        viewController.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "college", size: 35)!]
        
    }
    
    /*
    * CUSTOM LOGIN VIEW CONTROLLER
    *
    * DESCRIPTION:
    *   Customizes the login view controller
    */
    func customLoginViewController(viewController: LoginViewController, width: CGFloat, height: CGFloat) {
        
        /*
        * Creates the backdrop gradient color
        */
        viewController.view.backgroundColor = UIColor.orangeColor()
        
        gl.frame = viewController.view.bounds
        gl.colors = [colorTop, colorBottom]
        gl.locations = [0.0,1.0]
        
        viewController.view.layer.insertSublayer(gl, atIndex: 0)
        /**********************************************************/
        
        /*
        * Creates the custom text boxes
        */
        
        //Email text field
        viewController.Email.textColor = blueColor
        viewController.Email.layer.cornerRadius = 15
        viewController.Email.layer.backgroundColor = UIColor.whiteColor().CGColor
        viewController.Email.layer.borderColor = UIColor.whiteColor().CGColor
        viewController.Email.layer.borderWidth = 2
        viewController.Email.leftView = UIView(frame: CGRectMake(0, 0, 15, viewController.Email.frame.height))
        viewController.Email.leftViewMode = UITextFieldViewMode.Always
        
        //Password text field
        viewController.Password.textColor = blueColor
        viewController.Password.layer.cornerRadius = 15
        viewController.Password.layer.backgroundColor = UIColor.whiteColor().CGColor
        viewController.Password.layer.borderColor = UIColor.whiteColor().CGColor
        viewController.Password.layer.borderWidth = 2
        viewController.Password.leftView = UIView(frame: CGRectMake(0, 0, 15, viewController.Password.frame.height))
        viewController.Password.leftViewMode = UITextFieldViewMode.Always
     
        
        //Login button 
        viewController.loginBtn.layer.cornerRadius = 25
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
