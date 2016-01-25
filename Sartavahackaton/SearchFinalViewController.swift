//
//  SearchFinalViewController.swift
//  Sartavahackaton
//
//  Created by ori mizrachi on 1/25/16.
//  Copyright © 2016 Bipolar. All rights reserved.
//

import UIKit
import MapKit

class SearchFinalViewController: UIViewController, MKMapViewDelegate {

    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let LocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.checkLocationAuthorize()

    }
    
    func checkLocationAuthorize() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            map.showsUserLocation = true
        }
    }


}
