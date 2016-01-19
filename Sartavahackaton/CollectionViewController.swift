//
//  AttractionPageViewController.swift
//  Sartavahackaton
//
//  Created by Amit on 14/01/2016.
//  Copyright © 2016 B-Up!. All rights reserved.
//

import UIKit
class CollectionViewController: UIViewController {
    var UserImg : UIImage?
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var UserImage: UIImageView!
    var image = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
    self.img.image = self.image
    self.UserImage.image = UserImg
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
