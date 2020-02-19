import Foundation

struct ForecastWeatherViewModel {
    
    let weatherThemparatures: [Double]
    let wind: [Double]?
    let clouds: [Double]
    let weatherIcons: [String]
    let timeUTC: [Double]
    
    init(_ weather: ForecastWeather) {
        weatherThemparatures = weather.forecastWeather.map { $0.weatherDetails.temparature }
        wind = weather.forecastWeather.map { ($0.wind.speed ?? 0) }
        clouds = weather.forecastWeather.map { $0.clouds.cloudnesPercentage }
        weatherIcons = weather.forecastWeather
            .compactMap { $0.weatherDescription.first?.icon }
            .map { "https://openweathermap.org/img/w/" + $0 + ".png" }
        timeUTC = weather.forecastWeather.map { $0.calculationTimeUTC }
    }
}
