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
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBOutlet weak var clothingImageView: UIImageView!
    @IBOutlet weak var clothingLabel: UILabel!
    
    @IBOutlet weak var dayLabel: UILabel!
    
    
    var locationManager : CLLocationManager!
    var location : [CLLocation]?
    var user: PFUser?
    var settings: NSDictionary?
    
    //Initialize API call, and set up main screen
    override func viewWillAppear(_ animated: Bool) {
        
        /**
        var temperature: Int;
        var weather: String;
        
        
        /*******************
        //API call goes here
        *******************/
        
        if (weather == 'sunny') {
            
            //logic not correct but u get the idea
            if (temperature <= 50) {
                //coat
            }
            
            if (temperature > 50 && temperature <= 60) {
                //hoodie
            }
            
            if (temperature > 60) {
                //shirt
            }
        }
        //and so on...
        
        */
        
    }
    
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
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
