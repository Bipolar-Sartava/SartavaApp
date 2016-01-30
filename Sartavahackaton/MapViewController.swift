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
    let regionRadius: CLLocationDistance = 10000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Side Menu Stuff
        if self.revealViewController() != nil {
            btnMenu.target = self.revealViewController()
            btnMenu.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        map.delegate = self
        
        //Nav Bar Stuff
        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = UIColor(red: 104/255, green: 174/255, blue: 235/225, alpha: 1.0)
        navBar?.tintColor = UIColor.whiteColor()
        
        
        self.addBorderPass(32.009444, long: 34.876944, title: "Ben Guryon Airport", type: "Airport")
        self.addBorderPass(32.1148886, long: 34.784341, title: "Dov Hoz Airport", type: "Airport")
        self.addBorderPass(29.555262, long: 34.960212, title: "Marina of Eilta", type: "Seaport")
        self.addBorderPass(32.087055, long: 34.767396, title: "Marina of Tel Aviv", type: "Seaport")
        self.addBorderPass(32.1644327, long: 34.797553, title: "Marina of Herzelia", type: "Seaport")
        self.addBorderPass(31.6807965, long: 34.5664188, title: "Marina of Ashkelon", type: "Seaport")
 
        
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
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier("pin") as? MKPinAnnotationView

        if annotation.isKindOfClass(Airport) {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            pinView?.canShowCallout = true
            pinView!.animatesDrop = true
            //pinView!.image = UIImage(named: "Arrow.png")
            pinView?.pinColor = .Green
        }
        
        else if annotation.isKindOfClass(Seaport) {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            pinView?.canShowCallout = true
            pinView!.animatesDrop = true
            //pinView!.image = UIImage(named: "Arrow.png")
            pinView?.pinColor = .Purple
        }
        return pinView
    }
    
    func addBorderPass(lat: Double, long: Double, title: String, type: String) {
        if type == "airport" || type == "Airport" {
            let annotation = Airport.init(latitude: lat, longitude: long)
            annotation.title = title
            map.addAnnotation(annotation)
        }
        
        if type == "seaport" || type == "Seaport" {
            let annotation = Seaport.init(latitude: lat, longitude: long)
            annotation.title = title
            map.addAnnotation(annotation)
        }
        
    }

}
