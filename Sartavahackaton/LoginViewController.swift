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
    override func viewDidLoad() {
        super.viewDidLoad()

        

    }

    
    func LogIn() {
        var user = PFUser()
        user.username = userNameTF.text
        user.password = passTF.text
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
