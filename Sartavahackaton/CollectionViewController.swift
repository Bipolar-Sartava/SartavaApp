//
//  AttractionPageViewController.swift
//  Sartavahackaton
//
//  Created by Amit on 14/01/2016.
//  Copyright © 2016 B-Up!. All rights reserved.
//

import UIKit
class CollectionViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var imagesent : UIImageView!
    var userimages : [UIImageView]!
    //scroll view
    @IBOutlet weak var scrollview: UIScrollView!
    
    var ipc : UIImagePickerController?
    
    //Create another UIBarButtonItem(Camera)
    
    func addItem()
        
    {
        
        let camera : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Camera, target: self, action: "ActivateCamera")
        
        self.navigationItem.rightBarButtonItem = camera
        
        let fave : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Bookmarks
            , target: self, action: "ActivateFave")
        
        self.navigationItem.leftBarButtonItem = fave
        
    }
    //Activate Favorites
    func ActivateFave()
    {
    
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
        userimages = [UserImage1,UserImage2,UserImage3]
        for(var i=0;i<userimages.count;i++)
        {
            userimages[i].image = info[UIImagePickerControllerOriginalImage] as! UIImage?
        }

        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var UserImage1: UIImageView!
    @IBOutlet weak var UserImage2: UIImageView!
    @IBOutlet weak var UserImage3: UIImageView!
    var image = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
    self.addItem()
    self.img.image = self.image
    scrollview.contentSize.width = 1000
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
