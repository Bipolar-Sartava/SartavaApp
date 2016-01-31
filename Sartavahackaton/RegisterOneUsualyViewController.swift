//
//  RegisterOneUsualyViewController.swift
//  Sartavahackaton
//
//  Created by ori mizrachi on 1/16/16.
//  Copyright © 2016 B-Up!. All rights reserved.
//

import UIKit
import Parse

class RegisterOneUsualyViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var ChoosingYourPicture: UIButton!
    @IBOutlet weak var FirstNameAndLast: UILabel!

    @IBOutlet weak var userProfilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func btnContinue(sender: UIButton) {
        
        //if First name is empty
        if lNameTF.text?.isEmpty == true && fNameTF.text?.isEmpty == true {
            let alert = UIAlertController(title: "Error", message: "You have to input your First and Last name", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        //If Last name is empty
        else if lNameTF.text?.isEmpty == true {
            let alert = UIAlertController(title: "Error", message: "You have to input your Last name", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
            
        else if fNameTF.text?.isEmpty == true {
            let alert = UIAlertController(title: "Error", message: "You have to input your First and Last name", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
    
            self.presentViewController(alert, animated: true, completion: nil)
        }
    
        else {
            let d: NSUserDefaults = NSUserDefaults.standardUserDefaults()
            d.setObject(fNameTF.text!, forKey: "fName")
            d.setObject(lNameTF.text!, forKey: "lName")
        }
    }

    @IBAction func changeProfilePicBtn(sender: AnyObject) {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        userProfilePic.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func UserUseEnglish() {
        OutletShowTrips.setTitle("Group Trips", forState: UIControlState.Normal)
      LastName.setTitle("Last Name", forState: UIControlState.Normal)
        FirstName.setTitle("First Name", forState: UIControlState.Normal)
        ChoosingYourPicture.setTitle("Choosing Your Picture", forState: UIControlState.Normal)
        FirstNameAndLast.setTitle("profile information", forState: UIControlState.Normal)
        LastName.titleLabel?.textAlignment = .Left
        FirstName.titleLabel?.textAlignment = .Left
    }
}
