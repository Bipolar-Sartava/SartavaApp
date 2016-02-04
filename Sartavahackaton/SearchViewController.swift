//
//  SearchViewController.swift
//  Sartavahackaton
//
//  Created by ori mizrachi on 1/13/16.
//  Copyright © 2016 B-Up!. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    @IBOutlet weak var outletTrips: UIButton!
    @IBOutlet weak var outletHotels: UIButton!
    @IBOutlet weak var outletAtt: UIButton!
        
    var blurEffectView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Menu Btn Stuff
        if self.revealViewController() != nil {
            btnMenu.target = self.revealViewController()
            btnMenu.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        //Nav Bar Stuff
        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = UIColor(red: 104/255, green: 174/255, blue: 235/225, alpha: 1.0)
        navBar?.tintColor = UIColor.whiteColor()
        
        //Blur
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        self.view.addSubview(blurEffectView)
        blurEffectView.layer.zPosition = 2
        bgImg.layer.zPosition = 1
        outletAtt.layer.zPosition = 3
        outletHotels.layer.zPosition = 3
        outletTrips.layer.zPosition = 3
        searchBar.layer.zPosition = 3
        view1.layer.zPosition = 3
        view2.layer.zPosition = 3
        view3.layer.zPosition = 3
        blurEffectView.alpha = 0.9
        blurEffectView.userInteractionEnabled = false
    }
}
