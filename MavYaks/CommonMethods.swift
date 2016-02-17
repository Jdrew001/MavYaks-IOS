//
//  CommonMethods.swift
//  MavYaks
//
//  Created by Drew on 2/16/16.
//  Copyright © 2016 dtatkison. All rights reserved.
//

import Foundation
import UIKit

class CommonMethods {
    
    func performSegueJump(viewController: UIViewController, identifier: String) {
        
        viewController.performSegueWithIdentifier(identifier, sender: nil)
        
    }
    
}
