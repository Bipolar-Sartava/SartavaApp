//
//  HomeViewController.swift
//  Sartavahackaton
//
//  Created by ori mizrachi on 1/13/16.
//  Copyright © 2016 B-Up!. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate{

    @IBAction func TripsBtn(sender: AnyObject)
    {

    }
    @IBAction func HotelsBtn(sender: AnyObject)
    {
        
    }
    @IBAction func AttractionsBtn(sender: AnyObject)
    {
        
    }
    //collection view protocols length
    let imageLable = ["Attraction1","Attraction2","Attraction3"]
    let images = [UIImage(named: "Plains 2"),UIImage(named: "Tree3"),UIImage(named: "Baloons")]
    @IBOutlet weak var clview: UICollectionView!

    
    //Writing protocols
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageLable.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = clview.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! Cell
        cell.img.image = self.images[indexPath.row]
        cell.lblT.text = self.imageLable[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("ShowInfo", sender: self)
    }
    
    //Show Image on the collectionviewcontroller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowInfo"
        {
            let indexPaths = self.clview!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            
            let vc = segue.destinationViewController as! CollectionViewController
            
            vc.image = self.images[indexPath.row]!
            vc.title = self.imageLable[indexPath.row]
        }
    }
    @IBOutlet weak var btnMenu: UIBarButtonItem!
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
        
        //blur effect
//        var blur = UIBlurEffect(style: UIBlurEffectStyle.Dark)
//        var blurView = UIVisualEffectView(effect: blur)
//        blurView.frame = view.bounds
//        blurView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
//        view.addSubview(blurView)
        
    }

    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
