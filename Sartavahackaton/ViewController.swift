//
//  ViewController.swift
//  Sartavahackaton
//
//  Created by ori mizrachi on 1/12/16.
//  Copyright © 2016 B-Up!. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let alert = UIAlertView(title: "Hello", message: "Heelo", delegate: self, cancelButtonTitle: "OK")
        
        self.view.addSubview(alert)
    }
    
    //hide status bar
    override func prefersStatusBarHidden() -> Bool {
        
        return true
    }
    


}

