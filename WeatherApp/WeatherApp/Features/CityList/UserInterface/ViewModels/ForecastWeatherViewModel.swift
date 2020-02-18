import Foundation

struct ForecastWeatherViewModel {
    
    let weatherTemparature: [Double]
    let wind: [Double]?
    let clouds: [Double]
    let weatherIcon: [String]
    let timeUTC: [Double]
    
    init(_ weather: ForecastWeather) {
        weatherTemparature = weather.forecastWeather.map { $0.weatherDetails.temparature }
        wind = weather.forecastWeather.map { ($0.wind.speed ?? 0) }
        clouds = weather.forecastWeather.map { $0.clouds.cloudnesPercentage }
        weatherIcon = weather.forecastWeather.map { ($0.weatherDescription.first?.icon ?? "")}
        timeUTC = weather.forecastWeather.map { $0.calculationTimeUTC }
    }
}
