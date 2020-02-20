import Foundation
import RxSwift

class WeatherDataRepository {
    
    let currentWeatherAPI: CurrentWeatherAPI
    
    init(currentWeatherAPI: CurrentWeatherAPI) {
        self.currentWeatherAPI = currentWeatherAPI
    }
    
    func getCurrentWeatherData(_ cityName: String) -> Single<CurrentWeather> {
        return currentWeatherAPI.getCurrentWeather(cityName)
    }
    
    func getForecastWeatherData(_ cityName: String) -> Single<ForecastWeather> {
        return currentWeatherAPI.getForcastWeather(cityName)
    }
}
