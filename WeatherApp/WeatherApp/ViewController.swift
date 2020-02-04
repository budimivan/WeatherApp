//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ivan Budim on 04/02/2020.
//  Copyright © 2020 Ivan Budim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let openWeatherMap = ApiServices(baseURL: "",query: "" )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getWeather()
    }
    
    func getWeather() {
        openWeatherMap.get()
    }

}

