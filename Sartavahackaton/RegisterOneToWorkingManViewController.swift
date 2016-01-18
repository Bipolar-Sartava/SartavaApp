//
//  RegisterOneToWorkingManViewController.swift
//  Sartavahackaton
//
//  Created by erez block on 1/16/16.
//  Copyright © 2016 B-Up!. All rights reserved.
//

import UIKit

class RegisterOneToWorkingManViewController: UIViewController {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var fNameTF: UITextField!
    @IBOutlet weak var lNameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnContinue(sender: UIButton) {
        //if First name and last name is empty
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
         
        //If First name is empty
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
    
    @IBAction func btnChangeProfliePic(sender: UIButton) {
        
    }

}
