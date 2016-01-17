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
        let d: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        d.setObject(fNameTF.text!, forKey: "fName")
        d.setObject(lNameTF.text!, forKey: "lName")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

}
