import Foundation
import RxSwift

class WeatherDataRepository {
    
    let currentWeatherAPI: CurrentWeatherAPI
    
    init(currentWeatherAPI: CurrentWeatherAPI) {
        self.currentWeatherAPI = currentWeatherAPI
    }
    
    func getCurrentWeatherData(_ cityName: String) -> Observable<CurrentWeather> {
        return currentWeatherAPI.getCurrentWeather(cityName)
    }
    
    func getForecastWeatherData(_ cityName: String) -> Observable<ForecastWeather> {
        return currentWeatherAPI.getForcastWeather(cityName)
    }
}
