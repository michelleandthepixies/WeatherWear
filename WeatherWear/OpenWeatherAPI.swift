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
    
    /**
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
                do {
                    let weather = try JSONSerialization.jsonObject(
                        with: data!,
                        options: .mutableContainers) as! [String: AnyObject]
                    print("\(weather["name"]!)")
                }
                catch let jsonError as NSError {
                    print("JSON error description: \(jsonError.description)")
                }
            }
        }
        dataTask.resume()
    }
 */
    
    func getWeather(success: @escaping (NSDictionary) -> (), failure: @escaping (Error) -> (), lat: Double, lon: Double) {
        let session = URLSession(
            configuration: .default,
            delegate: nil,
            delegateQueue: OperationQueue.main
        )
        
        let weatherRequestURL = URL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&lat=\(lat)&lon=\(lon)")!
        
        let dataTask = session.dataTask(with: weatherRequestURL as URL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                //print("Error:\n\(error)")
                failure(error)
            }
            else {
                do {
                    let weather = try JSONSerialization.jsonObject(
                        with: data!,
                        options: .mutableContainers) as! [String: AnyObject]
                    success(weather as NSDictionary)
                    //print("\(weather["name"]!)")
                }
                catch let jsonError as NSError {
                    print("JSON error description: \(jsonError.description)")
                    failure(error!)
                }
            }
        }
        dataTask.resume()
    }

    
}
