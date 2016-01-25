//
//  MapViewController.swift
//  Sartavahackaton
//
//  Created by ori mizrachi on 1/14/16.
//  Copyright © 2016 B-Up!. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var btnMenu: UIBarButtonItem!
    @IBOutlet weak var map: MKMapView!
    
    let LocationManager = CLLocationManager()
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Side Menu Stuff
        if self.revealViewController() != nil {
            btnMenu.target = self.revealViewController()
            btnMenu.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        //Nav Bar Stuff
        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = UIColor(red: 104/255, green: 174/255, blue: 235/225, alpha: 1.0)
        navBar?.tintColor = UIColor.whiteColor()
        
    }

    override func viewDidAppear(animated: Bool) {
        self.checkLocationAuthorize()
    }
    
    func checkLocationAuthorize() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            map.showsUserLocation = true
        }
            
        else {
            LocationManager.requestWhenInUseAuthorization()
        }
    }
    
    func centerMap(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2, regionRadius * 2)
        map.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        if let location = userLocation.location {
            centerMap(location)
        }
    
    }

}
