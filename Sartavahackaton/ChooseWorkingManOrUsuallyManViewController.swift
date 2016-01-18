//
//  ChooseWorkingManOrUsuallyManViewController.swift
//  Sartavahackaton
//
//  Created by Ori Mizrachi on 1/16/16.
//  Copyright © 2016 Bipolar!. All rights reserved.
//

import UIKit

class ChooseWorkingManOrUsuallyManViewController: UIViewController {

    @IBOutlet weak var OutletBussinesInfo: UIButton!
    @IBOutlet weak var OutletNormalInfo: UIButton!
    
    var d: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var isHighLighted: Bool = false
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnBussinesInfo(sender: AnyObject) {
        let ivBussinesinfo = UIImage(named: "ArrowDown.png")
        OutletBussinesInfo.setImage(ivBussinesinfo, forState: .Normal)
    }
    
    @IBAction func btnNormalInfo(sender: AnyObject) {
        let ivNormalInfo = UIImage(named: "ArrowDown.png")
        OutletNormalInfo.setImage(ivNormalInfo, forState: .Normal)
    }
    @IBAction func btnContinue(sender: UIButton) {
        
        if isHighLighted == false {
            let alert = UIAlertController(title: "Error", message: "You Have to choose the Track u want to Sign Up to", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        else if d.objectForKey("isBussines") as! Bool == false {
            let story = UIStoryboard(name: "Main", bundle: nil)
            let vc: UIViewController = story.instantiateViewControllerWithIdentifier("normalSignUpVc") as UIViewController
            
            self.presentViewController(vc, animated: true, completion: nil)
        }
    
        else if d.objectForKey("isBussines") as! Bool == true {
            let story = UIStoryboard(name: "Main", bundle: nil)
            let vc: UIViewController = story.instantiateViewControllerWithIdentifier("bussinesSignUpVc") as UIViewController
    
                self.presentViewController(vc, animated: true, completion: nil)
            }
    }


    @IBAction func bussinesBtnClicked(sender: UIButton) {
        //Highlight Button
        dispatch_async(dispatch_get_main_queue(), {

        if self.isHighLighted == false {
            sender.highlighted = true
            self.isHighLighted = true
        }
            
        else {
                sender.highlighted = false
                self.isHighLighted = false
            }
        })
        
        //Save User Choice
        d.setObject(true, forKey: "isBussines")

    }
    
    @IBAction func userBtnClicked(sender: UIButton) {
        //Highlight Button
        dispatch_async(dispatch_get_main_queue(), {
            
            if self.isHighLighted == false {
                sender.highlighted = true
                self.isHighLighted = true
            }
                
            else {
                sender.highlighted = false
                self.isHighLighted = false
            }
        })
        
        //Save User Choice
        d.setObject(false, forKey: "isBussines")
    }

}
