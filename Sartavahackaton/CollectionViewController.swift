//
//  AttractionPageViewController.swift
//  Sartavahackaton
//
//  Created by Amit on 14/01/2016.
//  Copyright © 2016 B-Up!. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    var image = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
    self.img.image = self.image
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
