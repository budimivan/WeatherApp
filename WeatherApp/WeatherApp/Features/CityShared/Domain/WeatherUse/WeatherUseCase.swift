import Foundation
import RxSwift

class WeatherUseCase {
     
    let weatherRepository: WeatherDataRepository
    
    init(weatherRepository: WeatherDataRepository) {
        self.weatherRepository = weatherRepository
    }
    
    func getCurrentWeatherDataAPI(_ cityName: String) -> Observable<CurrentWeather> {
        return weatherRepository.getCurrentWeatherDataAPI(cityName)
    }
    
    func getForecastWeatherDataAPI(_ cityName: String) -> Observable<ForecastWeather> {
        return weatherRepository.getForecastWeatherDataAPI(cityName)
    }
    
    func getCurrentWeatherDataCD() -> Observable<[CurrentWeatherViewModel]> {
        return weatherRepository.getCurrentWeatherDataCD()
    }
    
    func getForecastWeatherDataCD() -> Observable<[ForecastWeatherViewModel]> {
        return weatherRepository.getForecastWeatherDataCD()
    }
    
     func storeWeatherData(forCityName cityName: String) -> Single<(CurrentWeather, ForecastWeather)>  {
        return weatherRepository.storeWeatherData(forCityName: cityName)
    }
}
