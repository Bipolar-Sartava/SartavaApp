//
//  LoginViewController.swift
//  Sartavahackaton
//
//  Created by ori mizrachi on 1/18/16.
//  Copyright © 2016 B-Up!. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passTF: UITextField!

    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var outletLogin: UIButton!
    @IBOutlet weak var fbSignOutlet: UIButton!
    @IBOutlet weak var signUpOutlet: UIButton!
    @IBOutlet weak var forgotPassOutlet: UIButton!

    var d: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        Shared.downloadAllAttractions()
    }
    
    override func viewDidAppear(animated: Bool) {
        userNameTF.text = d.objectForKey("userNameNSUSER") as? String
        //Check if its the first time
        if (d.objectForKey("HasLaunchedOnce5")?.boolValue == true) {
            // app already launched
        }
            
        else {
            // This is the first launch ever
            d.setBool(true, forKey: "HasLaunchedOnce5")
            let alert = UIAlertController(title: "Welcom", message: "What is your primary Language?", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "עברית", style: UIAlertActionStyle.Default, handler: { (alert) -> Void in
                self.d.setBool(false, forKey: "UserPrefEnglish")
            }))
            
            alert.addAction(UIAlertAction(title: "English", style: UIAlertActionStyle.Default, handler: { (alert) -> Void in
                self.d.setBool(true, forKey: "UserPrefEnglish")
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
            d.synchronize()
        }
        
        if d.boolForKey("UserPrefEnglish") == true {
            self.UserUseEnglish()
        }
    }
    
    @IBAction func ChangeLanguage(sender: UIButton) {
        if d.boolForKey("UserPrefEnglish") == false {
            self.d.setBool(true, forKey: "UserPrefEnglish")
        }
        
        else {
             self.d.setBool(false, forKey: "UserPrefEnglish")
        }
    }
    
    func UserUseEnglish() {
        //TFs
        userNameTF.placeholder = "User Name"
        userNameTF.textAlignment = .Left
        passTF.placeholder = "Password"
        passTF.textAlignment = .Left
        
        //Buttons
        outletLogin.setTitle("Login", forState: UIControlState.Normal)
        outletLogin.titleLabel?.textAlignment = .Center
        fbSignOutlet.setTitle("Sign Up With Facebook", forState: UIControlState.Normal)
        fbSignOutlet.titleLabel?.textAlignment = .Center
        signUpOutlet.setTitle("Sign Up", forState: UIControlState.Normal)
        signUpOutlet.titleLabel?.textAlignment = .Left
        forgotPassOutlet.setTitle("Forgot Pass?", forState: UIControlState.Normal)
        forgotPassOutlet.titleLabel?.textAlignment = .Left
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "logOut" {
            PFUser.logOut()
        }
    }
    
    func LogIn() {
        var user = PFUser()
        user.username = userNameTF.text
        user.password = passTF.text
        d.setObject(userNameTF.text, forKey: "userNameNSUSER")
        PFUser.logInWithUsernameInBackground(userNameTF.text!, password: passTF.text!, block: {
            (User: PFUser?, Error : NSError?) -> Void in
            
            if Error == nil {
                dispatch_async(dispatch_get_main_queue()) {
                    let story = UIStoryboard(name: "Main", bundle: nil)
                    let vc: SWRevealViewController = story.instantiateViewControllerWithIdentifier("logged") as! SWRevealViewController
                    
                    self.presentViewController(vc, animated: true, completion: nil)
                }
            }
                
            else {
                let alert = UIAlertController(title: "Error", message: "User Name Or Password Is Wrong", preferredStyle:     UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        })
    }
    
    @IBAction func LoginBtn(sender: AnyObject) {
        self.LogIn()
    }

}
