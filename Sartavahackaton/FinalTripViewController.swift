//
//  FinalTripViewController.swift
//  Sartaba
//
//  Created by ori mizrachi on 2/1/16.
//  Copyright © 2016 Bipolar. All rights reserved.
//

import UIKit
import Parse

class FinalTripViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var btnMenu: UIBarButtonItem!
    
    @IBOutlet weak var SearchTBL: UITableView!
    @IBOutlet weak var CreateView: UIView!
    @IBOutlet weak var SearchView: UIView!
    
    var namesShow: [String] = []
    var Trips: [PFObject] = []
    var d: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
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
        
        self.getAllTrips()
        
        SearchTBL.delegate = self
        SearchTBL.dataSource = self
        UsersNumPicker.delegate = self
        UsersNumPicker.dataSource = self
        
        if d.boolForKey("SearchTrips") == false {
            CreateView.hidden = false
            SearchView.hidden = true
        } else if d.boolForKey("SearchTrips") == true {
            SearchView.hidden = false
            CreateView.hidden = true
        }
    }
    
    func getAllTrips() {
        let query = PFQuery(className:"OrganizedTrips")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                self.Trips = objects!
                self.SearchTBL.reloadData()
            } else {
                let alert = UIAlertController(title: "Error", message: "An Error has occurred", preferredStyle:     UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alert, animated: true, completion: nil)
                print("error")
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return Trips.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ident: String = "identifier"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(ident) as UITableViewCell?
        
        if cell ==  nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: ident)
        }
        
        let Trip: PFObject = Trips[indexPath.row] as PFObject
        
        cell?.textLabel?.text = Trip.objectForKey("Name") as! String
        return cell!
    }
    
    //create view
    let pickerData = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

    @IBOutlet weak var TripNameTF: UITextField!
    @IBOutlet weak var SearchAtt: UITextField!
    @IBOutlet weak var PhoneTF: UITextField!
    @IBOutlet weak var UsersNumLbl: UILabel!
    @IBOutlet weak var DateLbl: UILabel!
    @IBOutlet weak var UsersNumPicker: UIPickerView!
    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBOutlet weak var textLbl: UITextField!
 
    @IBOutlet weak var CreateBtnOutlet: UIButton!

    @IBAction func CreateBtn(sender: UIButton) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        let date = dateFormatter.stringFromDate(DatePicker.date)
        
        if TripNameTF.text == "" {
            let alert = UIAlertController(title: "Error", message: "You Have to input the trips Name", preferredStyle:     UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))

            self.presentViewController(alert, animated: true, completion: nil)
        } else if SearchAtt.text == "" {
            let alert = UIAlertController(title: "Error", message: "You Have to input the Attraction for the trip", preferredStyle:     UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        } else if PhoneTF.text == "" || PhoneTF.text!.utf16.count != 10 {
            let alert = UIAlertController(title: "Error", message: "You Have to input your phone number", preferredStyle:     UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        } else if textLbl.text == "" {
            let alert = UIAlertController(title: "Error", message: "You Have to input some text about the trip", preferredStyle:     UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            var OrganizedTrips = PFObject(className: "OrganizedTrips")
            OrganizedTrips["Name"] = TripNameTF.text
            OrganizedTrips["Attraction"] = SearchAtt.text
            OrganizedTrips["UserPhone"] = PhoneTF.text
            OrganizedTrips["UsersNumber"] = 5 //UsersNumPicker
            OrganizedTrips["DateOfTrip"] = date
            OrganizedTrips["Text"] = textLbl.text
            OrganizedTrips["Creator"] = PFUser.currentUser()?.username
            OrganizedTrips.saveInBackground()
        
            let alert = UIAlertController(title: "Created!", message: "You Have successfully Created a trip!", preferredStyle:      UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (alert) -> Void in
            
                self.CreateView.hidden = true
                self.SearchView.hidden = false
            }))
        
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(pickerData[component])"
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    
}
