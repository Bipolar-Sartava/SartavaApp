//
//  TripsViewController.swift
//  Sartaba
//
//  Created by ori mizrachi on 2/1/16.
//  Copyright © 2016 Bipolar. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController {

    @IBOutlet weak var btnMenu: UIBarButtonItem!
    @IBOutlet weak var SearchTrip: UIButton!
    @IBOutlet weak var CreateTrip: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Menu Btn Stuff
        if self.revealViewController() != nil {
            btnMenu.target = self.revealViewController()
            btnMenu.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        //Side Menu Custoization
        revealViewController().rearViewRevealWidth = 160
        revealViewController().rearViewRevealDisplacement = 60
        revealViewController().frontViewShadowRadius = 25
        revealViewController().frontViewShadowOffset = CGSizeMake(0.0, 2.5)
        revealViewController().frontViewShadowOpacity = 1.0
        revealViewController().frontViewShadowColor = UIColor.blackColor()
        revealViewController().toggleAnimationDuration = 0.7
        
        //Nav Bar Stuff
        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = UIColor(red: 104/255, green: 174/255, blue: 235/225, alpha: 1.0)
        navBar?.tintColor = UIColor.whiteColor()
        
        CreateTrip.titleLabel?.textAlignment = .Right
        SearchTrip.titleLabel?.textAlignment = .Right
        
    }


}
