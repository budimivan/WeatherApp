import Foundation

struct CurrentWeatherViewModel {
    
    let cityID: Int
    let cityName: String
    let weatherTemparature: Double
    let weatherDescription: String
    let wind: Double?
    let clouds: Double
    let sunRise: Double
    let sunSet: Double
    let weatherIcon: String?
    let timeUTC: Double
    
    
    init(_ weather: CurrentWeather) {
        cityID = weather.cityID
        cityName = weather.cityName
        weatherTemparature = weather.weatherDetails.temparature
        weatherDescription = weather.weatherDescription.first!.description
        wind = weather.wind.speed
        clouds = weather.clouds.cloudnesPercentage
        sunRise = weather.sunRiseSet.sunRise
        sunSet = weather.sunRiseSet.sunSet
        weatherIcon = weather.weatherDescription.first?.icon
        timeUTC = weather.calculationTimeUTC
    }
}
