import Foundation

protocol ForecastWeatherDelegate: class {
    
    func handleForecastData(weatherViewModel: ForecastWeatherViewModel)
    
}
