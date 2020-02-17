import Foundation

class WeatherDataRepository {
    
    let currentWeatherAPI: CurrentWeatherAPI
    
    init(currentWeatherAPI: CurrentWeatherAPI) {
        self.currentWeatherAPI = currentWeatherAPI
    }
    
    func getWeatherData(handleCurrentWeather: @escaping (CurrentWeather) -> Void, _ cityName: String) {
        currentWeatherAPI.getCurrentWeather(handleCurrentWeather: handleCurrentWeather, cityName)
    }
}
