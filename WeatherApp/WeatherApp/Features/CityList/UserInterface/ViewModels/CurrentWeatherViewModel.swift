import Foundation

struct CurrentWeatherViewModel {
    
    let cityID: Int
    let cityName: String
    let weatherTemparature: Double
    let wind: Double?
    let sunRise: Double
    let sunSet: Double
    let weatherIcon: String?
    let timeUTC: Double
    
    
    init(_ weather: CurrentWeather) {
        cityID = weather.cityID
        cityName = weather.cityName
        weatherTemparature = weather.weatherDetails.temparature
        wind = weather.wind.speed
        sunRise = weather.sunRiseSet.sunRise
        sunSet = weather.sunRiseSet.sunSet
        weatherIcon = weather.weatherDescription.first?.icon
        timeUTC = weather.calculationTimeUTC
    }
}
