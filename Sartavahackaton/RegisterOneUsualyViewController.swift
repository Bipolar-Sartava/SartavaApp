//
//  RegisterOneUsualyViewController.swift
//  Sartavahackaton
//
//  Created by ori mizrachi on 1/16/16.
//  Copyright © 2016 B-Up!. All rights reserved.
//

import UIKit

class RegisterOneUsualyViewController: UIViewController {

    @IBOutlet weak var fNameTF: UITextField!
    @IBOutlet weak var lNameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func btnContinue(sender: AnyObject) {
        //Saving the Fname and Lname on NSUserDefaults
        if fNameTF.text?.utf16.count > 0 && lNameTF.text?.utf16.count > 0 {
            let d: NSUserDefaults = NSUserDefaults.standardUserDefaults()
            d.setObject(fNameTF.text!, forKey: "fName")
            d.setObject(lNameTF.text!, forKey: "lName")
        }
        
        //Building the errors if the TFs are empty
       else if fNameTF.text?.utf16.count == 0 {
            let alert = UIAlertController(title: "Error", message: "You Have to write Your First name", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        else if lNameTF.text?.utf16.count == 0  {
            let alert = UIAlertController(title: "Error", message: "You Have to write Your Last name", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

}
