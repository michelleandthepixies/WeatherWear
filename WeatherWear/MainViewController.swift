//
//  MainViewController.swift
//  WeatherWear
//
//  Created by Tim Kim on 4/6/17.
//  Copyright © 2017 Matthew Lee. All rights reserved.
//

import UIKit
import CoreLocation
import Parse

class MainViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager : CLLocationManager!
    var location : [CLLocation]?
    var user: PFUser?
    var settings: NSDictionary?
    
    
    // Need to initialize a default setting page
    override func viewDidLoad() {
        super.viewDidLoad()
        self.user = PFUser.current()
        if (user?["setting"] == nil) {
            print("setting is nil")
            setFirstTime();
        }
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 200
        locationManager.requestWhenInUseAuthorization()

        // Do any additional setup after loading the view.
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setFirstTime() {
        let alert = UIAlertController(title: "WeatherWear", message: "This is your first time using WeatherWear! We will set you up with your current location for now. ☀️ You can change your settings later!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "We'll see 🌝", style: UIAlertActionStyle.default, handler: nil))
        //self.present(alert, animated: true, completion: nil)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true, completion: nil)
        })
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
}
