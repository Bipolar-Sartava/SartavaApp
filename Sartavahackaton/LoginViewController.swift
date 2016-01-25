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
        //Check if its the first time
        if (NSUserDefaults.standardUserDefaults().boolForKey("HasLaunchedOnce")) {
            // app already launched
        }
        else {
            // This is the first launch ever
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "HasLaunchedOnce")
            let alert = UIAlertController(title: "Error", message: "What is your primary Language?", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "עברית", style: UIAlertActionStyle.Default, handler: { (alert) -> Void in
                self.d.setBool(true, forKey: "UserPrefEnglish")
            }))
            
            alert.addAction(UIAlertAction(title: "English", style: UIAlertActionStyle.Default, handler: { (alert) -> Void in
                self.d.setBool(true, forKey: "UserPrefEnglish")
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        if d.boolForKey("UserPrefEnglish") {
            self.UserUseEnglish()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        userNameTF.text = d.objectForKey("userNameNSUSER") as? String
    }
    
    func UserUseEnglish() {
        //TFs
        userNameTF.placeholder = "User Name"
        userNameTF.textAlignment = .Left
        passTF.placeholder = "Password"
        passTF.textAlignment = .Left
        
        //Buttons
        outletLogin.titleLabel?.text = "Login"
        outletLogin.titleLabel?.textAlignment = .Center
        fbSignOutlet.titleLabel?.text = "Sign Up With Facebook"
        fbSignOutlet.titleLabel?.textAlignment = .Center
        signUpOutlet.titleLabel?.text = "Sign Up"
        signUpOutlet.titleLabel?.textAlignment = .Center
        forgotPassOutlet.titleLabel?.text = "Forgot Pass?"
        forgotPassOutlet.titleLabel?.textAlignment = .Center
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
