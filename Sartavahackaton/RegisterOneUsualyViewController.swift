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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

}
