import Foundation

protocol CurrentWeatherDelegate: class {
    
    func handleWeatherData(weatherViewModel: CurrentWeatherViewModel)
}
