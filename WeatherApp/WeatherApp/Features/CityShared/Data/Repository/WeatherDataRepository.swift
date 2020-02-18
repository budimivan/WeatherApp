import Foundation

class WeatherDataRepository {
    
    let currentWeatherAPI: CurrentWeatherAPI
    
    init(currentWeatherAPI: CurrentWeatherAPI) {
        self.currentWeatherAPI = currentWeatherAPI
    }
    
    func getCurrentWeatherData(handleCurrentWeather: @escaping (CurrentWeather) -> Void, _ cityName: String) {
        currentWeatherAPI.getCurrentWeather(handleCurrentWeather: handleCurrentWeather, cityName)
    }
    
    func getForecastWeatherData(handleForecastWeather: @escaping (ForecastWeather) -> Void, _ cityName: String) {
        currentWeatherAPI.getForcastWeather(handleForecastWeather: handleForecastWeather, cityName)
    }
}
