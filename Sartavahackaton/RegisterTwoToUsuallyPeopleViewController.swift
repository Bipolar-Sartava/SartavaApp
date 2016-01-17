//
//  RegisterTwoToUsuallyPeopleViewController.swift
//  Sartavahackaton
//
//  Created by erez block on 1/16/16.
//  Copyright © 2016 B-Up!. All rights reserved.
//

import UIKit
import Parse

class RegisterTwoToUsuallyPeopleViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var secondPassTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    func LogIn() {
        
    }
    
    func SignUp() {
        let d: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var user = PFUser()
        
        //Save User data in DB
        user.username = userNameTF.text
        user.password = passTF.text
        user.email = emailTF.text
        
        user.setObject(d.objectForKey("fName")!, forKey: "fName")
        user.setObject(d.objectForKey("lName")!, forKey: "lName")
        user.setObject(d.objectForKey("isBussines")!, forKey: "isBussines")
        
        if passTF.text != secondPassTF.text {
                let alert = UIAlertController(title: "Error", message: "Your passwords does not match", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
        }
        
        else {
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
                    print(error)
                    let alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle:     UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            })
        
        }
    }
    
    @IBAction func showPassBtn(sender: AnyObject) {
        passTF.secureTextEntry = false
    }
    @IBAction func btnCountinue(sender: AnyObject) {
        self.SignUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
