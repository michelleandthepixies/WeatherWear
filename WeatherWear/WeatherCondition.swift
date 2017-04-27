//
//  WeatherCondition.swift
//  WeatherWear
//
//  Created by Michelle Shu on 4/27/17.
//  Copyright © 2017 Matthew Lee. All rights reserved.
//

import UIKit

class WeatherCondition: NSObject {
    var user: NSDictionary?
    var descript: String?

    init(dictionary: NSDictionary) {
        //deserialization code
        
        // description "haze" deserialization
        let description = dictionary.value(forKeyPath: "weather") as! NSArray
        let weatherDictionary = description[0] as! NSDictionary
        self.descript = weatherDictionary.value(forKeyPath: "description") as? String
        
        // Hi Tim! try other things here, i.e. temperature.
        
        
        }
    }
