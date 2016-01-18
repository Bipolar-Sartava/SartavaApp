//
//  RegisterTwoToWorkingManViewController.swift
//  Sartavahackaton
//
//  Created by erez block on 1/16/16.
//  Copyright © 2016 B-Up!. All rights reserved.
//

import UIKit
import Parse

class RegisterTwoToWorkingManViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var secondPassTF: UITextField!
    @IBOutlet weak var bussinesNameTF: UITextField!
    @IBOutlet weak var bussinesNumberTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    
    var showPass: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func SignUp() {
        let d: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var user = PFUser()
        
        //Save User data in DB
        user.username = userNameTF.text
        user.password = passTF.text
        user.email = emailTF.text
        
        //Check if pass match
        if passTF.text != secondPassTF.text {
            let alert = UIAlertController(title: "Error", message: "Your passwords does not match", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
            
        else if bussinesNumberTF.text?.isEmpty == true && bussinesNumberTF.text?.isEmpty == true && addressTF.text?.isEmpty == true {
            let alert = UIAlertController(title: "Error", message: "You have to input your Business Name, Address and Number", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
            
        else if bussinesNumberTF.text?.isEmpty == true {
            let alert = UIAlertController(title: "Error", message: "You have to input your Business Number", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
            
        else if bussinesNameTF.text?.isEmpty == true {
            let alert = UIAlertController(title: "Error", message: "You have to input your Business Name", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
            
        else if addressTF.text?.isEmpty == true {
            let alert = UIAlertController(title: "Error", message: "You have to input your Business Address", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        else {
            //set the user exta data
            user.setObject(d.objectForKey("fName")!, forKey: "fName")
            user.setObject(d.objectForKey("lName")!, forKey: "lName")
            user.setObject(d.objectForKey("isBussines")!, forKey: "isBussines")
            user.setObject(bussinesNameTF.text!, forKey: "bussinesName")
            user.setObject(bussinesNumberTF.text!, forKey: "bussinesNumber")
            user.setObject(addressTF.text!, forKey: "address")
            
            //sign up the user
            user.signUpInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                
                //If Signed Up Succsesfully
                if error == nil {
                    let alert = UIAlertController(title: "Signed Up!", message: "You Have successfully Signed Up!", preferredStyle:     UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                }
                    //If there is an error with sign up
                else {
                    let userError: NSString = (error?.localizedDescription)!
                    let alert = UIAlertController(title: "Error", message: "\(userError)", preferredStyle:     UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            })
        }
    }

    @IBAction func btnContinue(sender: UIButton) {
        self.SignUp()
    }

    @IBAction func showPassBtn(sender: UIButton) {
        showPass = !showPass
        if showPass == true {
            passTF.secureTextEntry = false
        }
            
        else if showPass == false {
            passTF.secureTextEntry = true
        }
    }

}
