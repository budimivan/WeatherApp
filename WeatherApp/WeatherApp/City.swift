//
//  City.swift
//  WeatherApp
//
//  Created by Ivan Budim on 04/02/2020.
//  Copyright © 2020 Ivan Budim. All rights reserved.
//

import Foundation

struct CurrentWeather: Decodable {
    
    let weather: [Weather]
    let main: Main
    let sys: Sys
    
    private enum CodingKeys: String, CodingKey {
       
        case weather
        case main
        case sys
    }
    
    init(from decoder: Decoder) throws {
        
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        self.weather = try valueContainer.decode([Weather].self, forKey: CodingKeys.weather)
        self.main = try valueContainer.decode(Main.self, forKey: CodingKeys.main)
        self.sys = try valueContainer.decode(Sys.self, forKey: CodingKeys.sys)
       
    }
}
    
struct Weather: Decodable {
    
    let description: String
    let icon: String
    let id: Int
    let main: String
}

struct Main: Decodable {

    let temparature: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
   
   
    private enum CodingKeys: String, CodingKey {
       
        case humidity
        case pressure
        case temparature = "temp"
        case tempMax = "temp_max"
        case tempMin = "temp_min"
        case feelsLike = "feels_like"
    }
}

struct Sys: Decodable {
    let type: Int
    let country: String
    let countryID: Int
    let sunRise: Int
    let sunSet: Int
    
    private enum CodingKeys: String, CodingKey {
        case type
        case country
        case countryID = "id"
        case sunRise = "sunrise"
        case sunSet = "sunset"
    }

}
