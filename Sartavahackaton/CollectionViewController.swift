//
//  AttractionPageViewController.swift
//  Sartavahackaton
//
//  Created by Amit on 14/01/2016.
//  Copyright © 2016 B-Up!. All rights reserved.
//

import UIKit
class CollectionViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIScrollViewDelegate {
    var imagesent : UIImageView!
    var userimages : [UIImageView] = []
    var counter : Int = 0
    var lastx  : CGFloat = 0
    //scroll view
    @IBOutlet weak var scrollview: UIScrollView!
    
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
        let iv : UIImageView =  UIImageView(frame: CGRectMake(lastx + 10, 5, 150, 150))
        lastx = lastx + 180
        scrollview.contentSize.width = lastx + 230
        iv.image = info[UIImagePickerControllerOriginalImage] as! UIImage?
        scrollview.addSubview(iv)
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBOutlet weak var img: UIImageView!
    var image = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
    self.addItem()
    self.img.image = self.image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
