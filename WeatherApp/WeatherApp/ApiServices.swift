//
//  ApiServices.swift
//  WeatherApp
//
//  Created by Ivan Budim on 04/02/2020.
//  Copyright © 2020 Ivan Budim. All rights reserved.
//

import Foundation

class ApiServices {
    
    
    init(baseURL: String, query: String) {
        
    }
    
    
    let baseURL = URL(string: "https://api.openweathermap.org/data/2.5/weather")!
      
    let query: [String: String] = [
          "appid": "0ae08e96bcda3b9db5d64ea863097b60",
          "q": "Zagreb,HR",
      ]
      
    func get () {
        
        let url = baseURL.withQueries(query)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        let jsonDecoder = JSONDecoder()
            if let data = data,
                let city = try? jsonDecoder.decode(CurrentWeather.self, from: data) {
                print(city.sys.country)
        
                }
              }
        
          
        task.resume()
        
    }
}
