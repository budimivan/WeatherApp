import Foundation
import CoreData

struct ForecastWeatherViewModel {
    
    let weatherTemparature: [Double]
    let wind: [Double]?
    let clouds: [Double]
    let weatherIcons: [String]
    let timeUTC: [Double]
    
    init(_ weather: ForecastWeather) {
        weatherTemparature = weather.forecastWeather.map { $0.weatherDetails.temparature }
        wind = weather.forecastWeather.map { ($0.wind.speed ?? 0) }
        clouds = weather.forecastWeather.map { $0.clouds.cloudnesPercentage }
        weatherIcons = weather.forecastWeather
            .compactMap { $0.weatherDescription.first?.icon }
            .map { "https://openweathermap.org/img/w/" + $0 + ".png" }
        timeUTC = weather.forecastWeather.map { $0.calculationTimeUTC }
    }
    
    init(_ weather: CDforecastWeather) {
        weatherTemparature = weather.weatherTemparatures.map { $0 as! CDweatherTemparatures }.map { $0.weatherTemparatures }
        wind = weather.wind.map { $0 as! CDwind }.map { $0.wind }
        clouds = weather.clouds.map { $0 as! CDclouds }.map { $0.clouds }
        weatherIcons = weather.weatherIcons.map { $0 as! CDweatherIcons }.map { $0.weatherIcons }
        timeUTC = weather.timeUTC.map { $0 as! CDtimeUTC }.map { $0.timeUTC }
    }
}
