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
    
    var imagePath: String {
        "https://openweathermap.org/img/w/" + (weatherIcon ?? "") + ".png"
    }
    
    init(_ weather: CurrentWeather) {
        cityID = weather.cityID
        cityName = weather.cityName
        weatherTemparature = weather.weatherDetails.temparature
        weatherDescription = weather.weatherDescription.first?.description ?? ""
        wind = weather.wind.speed
        clouds = weather.clouds.cloudnesPercentage
        sunRise = weather.sunRiseSet.sunRise
        sunSet = weather.sunRiseSet.sunSet
        weatherIcon = weather.weatherDescription.first?.icon
        timeUTC = weather.calculationTimeUTC
    }
    
    init(_ weather: CDcurrentWeather) {
        cityID = Int(weather.cityID)
        cityName = weather.cityName
        weatherTemparature = weather.weatherTemparature
        weatherDescription = weather.weatherDescription
        wind = weather.wind
        clouds = weather.clouds
        sunRise = weather.sunRise
        sunSet = weather.sunSet
        weatherIcon = weather.weatherIcon
        timeUTC = weather.timeUTC
    }
}
