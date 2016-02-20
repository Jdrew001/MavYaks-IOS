//
//  ProfileStartUpViewController.swift
//  MavYaks
//
//  Created by Drew on 2/16/16.
//  Copyright © 2016 dtatkison. All rights reserved.
//

import UIKit

class ProfileStartUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //Variables and outlets
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var firstnameErrorTxt: UILabel!
    @IBOutlet weak var lastnameErrorTxt: UILabel!
    var imagePicker = UIImagePickerController()
    @IBOutlet weak var imageView: UIImageView!
    private let profileBusiness = ProfileBusiness()
    
    /*
    * View did load method
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2;
        self.imageView.clipsToBounds = true;
        
        // Do any additional setup after loading the view.
    }
    
    /*
    * FIND A PICTURE BUTTON PRESSED
    *
    * DESCRIPTION:
    *
    * method goes and brings up the gallary on the phone and then retrieves a picture based on what you touched
    */
    @IBAction func findAPictureBtn(sender: AnyObject) {
        
        //Code to retrieve a picture from the users phone!
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            print("Button capture")
            
            
            
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            imagePicker.allowsEditing = false
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
            
            
        }
    }
    
    /*
    * IMAGE PICKER CONTROLLER
    *
    * DESCRIPTION: 
    *   
    * method detects when an image is picked and then adds it to the image view within the application
    */
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        print("Image picked")
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        imageView.image = image
        
    }
    
    
    /*
    * IMAGE PICKER DID CANCEL
    *
    * DESCRIPTION:
    * Method is called when the user touches the cancel button within the gallary screen
    *
    */
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    * SAVE BTN
    *
    * This saves the users information
    * ** If no picture is chosen, then add a picture to it
    */
    @IBAction func saveBtn(sender: AnyObject) {
        
        //Save to the database through the business logic
        //Throw the image to the user profile object
        let firstName = ValidateUITextField(textfield: firstNameTxt)
        let lastName = ValidateUITextField(textfield: lastNameTxt)
        
        
        if firstName.checkInput(firstnameErrorTxt, message: "Firstname") == true && lastName.checkInput(lastnameErrorTxt, message: "Lastname") == true {
            
            if imageView.image == nil {
                
                profileBusiness.saveUserProfile(UserProfile(image: UIImage(named: "no-image")!, firstName: firstNameTxt.text!, lastName: lastNameTxt.text!))
                
                goToNextView()
                
                print("This ran")
                
            } else {
                
                profileBusiness.saveUserProfile(UserProfile(image: imageView.image!, firstName: firstNameTxt.text!, lastName: lastNameTxt.text!))
                
                goToNextView()
            }
            
            
            
        }
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        performSegueWithIdentifier("main", sender: self)
    }
    
}
