//
//  OpenWeatherAPI.swift
//  WeatherWear
//
//  Created by Michelle Shu on 4/6/17.
//  Copyright © 2017 Matthew Lee. All rights reserved.
//

import Foundation

class WeatherGetter {
    
    private let openWeatherMapBaseURL = "http://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "dc3f5b7cb3ec5f2985b34234606d73c3"
    
    func getWeather(lat: Double, lon: Double) {
        let session = URLSession(
            configuration: .default,
            delegate: nil,
            delegateQueue: OperationQueue.main
        )
        
        let weatherRequestURL = URL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&lat=\(lat)&lon=\(lon)")!
        
        let dataTask = session.dataTask(with: weatherRequestURL as URL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print("Error:\n\(error)")
            }
            else {
                let dataString = String(data: data!, encoding: String.Encoding.utf8)
                print("JSON data:\n\(dataString!)")
                //return data["name"]
            }
        }
        dataTask.resume()
    }
    
}
