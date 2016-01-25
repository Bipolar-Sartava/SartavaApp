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

    var d: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(animated: Bool) {
        userNameTF.text = d.objectForKey("userNameNSUSER") as? String
        print(d.objectForKey("userNameNSUSER"))
        
        let bgImages = ["Baloons", "Plains 2", "Tree3"]
        
        let RandomBgImg = arc4random()%3
    
        if RandomBgImg == 1 {
            bgImg.image = UIImage(named: bgImages[0])
        }
        
        else if RandomBgImg == 1 {
               bgImg.image = UIImage(named: bgImages[1])
        }
        
        else if RandomBgImg == 1 {
               bgImg.image = UIImage(named: bgImages[2])
        }
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
