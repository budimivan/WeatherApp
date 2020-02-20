import Foundation
import RxSwift

class WeatherUseCase {
     
    let weatherRepository: WeatherDataRepository
    
    init(weatherRepository: WeatherDataRepository) {
        self.weatherRepository = weatherRepository
    }
    
    func getCurrentWeatherData(_ cityName: String) -> Single<CurrentWeather> {
        return weatherRepository.getCurrentWeatherData(cityName)
    }
    
    func getForecastWeatherData(_ cityName: String) -> Single<ForecastWeather> {
        return weatherRepository.getForecastWeatherData(cityName)
    }
}
