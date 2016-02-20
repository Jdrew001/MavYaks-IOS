//
//  ProfileStartUpViewController.swift
//  MavYaks
//
//  Created by Drew on 2/16/16.
//  Copyright © 2016 dtatkison. All rights reserved.
//

import UIKit

class ProfileStartUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var usernameTxt: UITextField!
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    
    private let profileBusiness = ProfileBusiness()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2;
        self.imageView.clipsToBounds = true;

        // Do any additional setup after loading the view.
    }
    @IBAction func findAPictureBtn(sender: AnyObject) {
        
        //Code to retrieve a picture from the users phone!
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            print("Button capture")
            
            
            
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            imagePicker.allowsEditing = false
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
            
            
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        print("Image picked")
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        imageView.image = image
        
        
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveBtn(sender: AnyObject) {
        
        //Save to the database through the business logic
        //Throw the image to the user profile object
        profileBusiness.saveUserProfile(UserProfile(image: imageView.image!, firstName: firstNameTxt.text!, lastName: lastNameTxt.text!))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
