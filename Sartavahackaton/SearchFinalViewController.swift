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

    
    @IBOutlet weak var SearchOnTheMap: UIButton!
    @IBOutlet weak var Favorite: UIButton!
    @IBOutlet weak var NearToMe: UIButton!
    @IBOutlet weak var SearchAll: UIButton!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let LocationManager = CLLocationManager()
    let regionRadius: CLLocationDistance = 1000
    
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
    func HebrewToEnglish(){
        SearchAll.setTitle("Search All", forState: UIControlState.Normal)
        Favorite.setTitle("Recomended", forState: UIControlState.Normal)
        NearToMe.setTitle("Near Me", forState: UIControlState.Normal)
        SearchOnTheMap.setTitle("Screach On The Map", forState: UIControlState.Normal)
        
        
    }
}
