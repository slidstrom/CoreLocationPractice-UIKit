//
//  ViewController.swift
//  CoreLocationPractice-UIKit
//
//  Created by DSIAdmin on 5/26/22.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        
    }

    @IBAction func btnFind(_ sender: Any) {
        
        setPinAndCenterLocation(CLLocationCoordinate2DMake(37.789467, -122.416772), "Cafe", "Honey Honey Cafe and Crepery")
        
    }
    
    func setPinAndCenterLocation(_ location: CLLocationCoordinate2D, _ title: String, _ subtitle: String){
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = title
        annotation.subtitle = subtitle
        mapView.addAnnotation(annotation)
        
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: 800, longitudinalMeters: 800)
        
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
    
}

