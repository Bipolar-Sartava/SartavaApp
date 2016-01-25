//
//  HomeViewController.swift
//  Sartavahackaton
//
//  Created by ori mizrachi on 1/13/16.
//  Copyright © 2016 B-Up!. All rights reserved.
//

import UIKit
import Parse
import MapKit

class HomeViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    //btns functions(Trips,Attractions and Hotels)
    @IBAction func TripsBtn(sender: AnyObject)
    {
        imageLable = ["Trips1","Trips2","Trips3"]
        images = [UIImage(named: "Baloons"),UIImage(named: "Tree3"),UIImage(named: "Plains 2")]
        clview.reloadData()
        
        clview.setContentOffset(CGPointMake(clview.center.x - clview.frame.size.width * 0.5, clview.frame.origin.y - clview.frame.size.height + 120), animated: true)
    }
    
    @IBAction func HotelsBtn(sender: AnyObject)
    {
        imageLable = ["Hotel1","Hotel2","Hotel3"]
        images = [UIImage(named: "Plains 2"),UIImage(named: "Baloons"),UIImage(named: "Tree3")]
        clview.reloadData()
        
        clview.setContentOffset(CGPointMake(clview.center.x - clview.frame.size.width * 0.5, clview.frame.origin.y - clview.frame.size.height + 120), animated: true)
    }
    
    @IBAction func AttractionsBtn(sender: AnyObject)
    {
        imageLable = ["Attraction1","Attraction2","Attraction3"]
        images = [UIImage(named: "Plains 2"),UIImage(named: "Tree3"),UIImage(named: "Baloons")]
        clview.reloadData()
        
        clview.setContentOffset(CGPointMake(clview.center.x - clview.frame.size.width * 0.5, clview.frame.origin.y - clview.frame.size.height + 120), animated: true)
      
    }
    
    //ipc
    var ipc : UIImagePickerController?
    //Create another UIBarButtonItem(Camera)
    func addItem()
    {
        let camera : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Camera, target: self, action: "ActivateCamera")
        self.navigationItem.rightBarButtonItem = camera
    }
    
    //Activate the camera 
    func ActivateCamera()
    {
        ipc = UIImagePickerController()
        //Checking if the device posses a camera
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            ipc?.sourceType = UIImagePickerControllerSourceType.Camera
        }
        else
        {
            ipc?.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        ipc?.delegate = self
        ipc?.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(ipc!, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let story : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let infovc : CollectionViewController = story.instantiateViewControllerWithIdentifier("InfoVC") as! CollectionViewController
        self.navigationController?.pushViewController(infovc, animated: true)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    //collection view protocols length
    var imageLable = ["Attraction1","Attraction2","Attraction3"]
    var images = [UIImage(named: "Plains 2"),UIImage(named: "Tree3"),UIImage(named: "Baloons")]
    @IBOutlet weak var clview: UICollectionView!
    //Writing protocols
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageLable.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = clview.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! Cell
        cell.img.image = self.images[indexPath.row]
        cell.lblT.text = self.imageLable[indexPath.row]
        
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        
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
    @IBOutlet weak var showProfileImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var outletTripsbtn: UIButton!
    
    let LocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Activate AddItem
        self.addItem()
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
        
        self.clview.backgroundColor = UIColor.clearColor()
        var usersNames: String = ""
        if let fName = PFUser.currentUser()?.objectForKey("fName"), let lName = PFUser.currentUser()?.objectForKey("lName") {
            usersNames = "\(fName) \(lName)"
        }
        
        nameLbl.text = usersNames
        outletTripsbtn.titleLabel?.textAlignment = .Right
    }
    
    override func viewDidAppear(animated: Bool) {
        showProfileImg.layer.cornerRadius = showProfileImg.frame.size.height/2
        showProfileImg.clipsToBounds = true
        showProfileImg.layer.borderWidth = 1
        
        self.checkLocationAuthorize()
    }
    
    func checkLocationAuthorize() {
        if CLLocationManager.authorizationStatus() != .AuthorizedWhenInUse {
            LocationManager.requestWhenInUseAuthorization()
        }
    }
}
