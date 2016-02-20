//
//  WelcomeViewController.swift
//  MavYaks
//
//  Created by Drew on 2/19/16.
//  Copyright © 2016 dtatkison. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.popToRootViewControllerAnimated(false)
        performSegueWithIdentifier("next", sender: self)
        
    }
    
    
    
}
