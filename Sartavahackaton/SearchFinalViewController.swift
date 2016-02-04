//
//  SearchFinalViewController.swift
//  Sartavahackaton
//
//  Created by ori mizrachi on 1/25/16.
//  Copyright © 2016 Bipolar. All rights reserved.
//

import UIKit

class SearchFinalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var SearchView: UIView!
    @IBOutlet weak var BackPageOut: UIButton!
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    @IBOutlet weak var ShowInfoTBL: UITableView!
    
<<<<<<< HEAD
    var names = ["he","yo","he","yo","he","yo"]
    var fullDesc = ["sda","asda","he","yo","he","yo"]
    var d: NSUserDefaults = NSUserDefaults.standardUserDefaults()
=======
    @IBOutlet weak var SearchOnTheMap: UIButton!
    @IBOutlet weak var Favorite: UIButton!
    @IBOutlet weak var NearToMe: UIButton!
    @IBOutlet weak var SearchAll: UIButton!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
>>>>>>> upstream/master
    
    var page = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ShowInfoTBL.delegate = self
        ShowInfoTBL.dataSource = self
        
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
        
        //Shared.downloadAllAttractions()
        
//        for var i = 0; i < names.count;i++ {
//            let attraction : Attraction = names[i] as! Attraction
//            print(attraction.name)
//        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: SearchCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SearchCell
        
        cell.nameLbl.text = names[indexPath.row]
        cell.textlbl.text = fullDesc[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        SearchView.frame = CGRect(x: 0, y: self.view.frame.size.height, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        UIView.animateWithDuration(1.0, animations: {self.SearchView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)})
        
        lbl.text = names[indexPath.row]
    }
    
    
    @IBAction func nextPageBtn(sender: UIButton) {
        d.setObject(page + 1, forKey: "PageNumber")
        print(page)
        
        if d.objectForKey("PageNumber") as! Int > 0 {
            BackPageOut.hidden = false
        }
    }

    @IBAction func backPageBtn(sender: UIButton) {
        d.setObject(page - 1, forKey: "PageNumber")
        print(page)
        
        if d.objectForKey("PageNumber") as! Int == 0 {
            BackPageOut.hidden = true
        }
    }
<<<<<<< HEAD
=======
    func HebrewToEnglish(){
        SearchAll.setTitle("Search All", forState: UIControlState.Normal)
        Favorite.setTitle("Recomended", forState: UIControlState.Normal)
        NearToMe.setTitle("Near Me", forState: UIControlState.Normal)
        SearchOnTheMap.setTitle("Screach On The Map", forState: UIControlState.Normal)
        
        
    }
>>>>>>> upstream/master
}
