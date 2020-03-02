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
    
    func storeWeatherData(_ currentWeather: CurrentWeatherViewModel, _ forecastWeather: ForecastWeatherViewModel) {
        weatherRepository.storeWeatherData(currentWeather, forecastWeather)
    }
    
    func getCurrentWeatherDataCD() -> Observable<[CurrentWeatherViewModel]> {
        return weatherRepository.getCurrentWeatherDataCD()
    }
    
    func getForecastWeatherDataCD() -> Observable<[ForecastWeatherViewModel]> {
        return weatherRepository.getForecastWeatherDataCD()
    }
}
