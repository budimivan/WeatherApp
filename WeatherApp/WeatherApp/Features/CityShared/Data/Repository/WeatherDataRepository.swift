import Foundation
import RxSwift

class WeatherDataRepository {
    
    private let disposeBag = DisposeBag()
    let currentWeatherAPI: CurrentWeatherAPI
    let weatherStore: WeatherStore
       
    init(currentWeatherAPI: CurrentWeatherAPI, weatherStore: WeatherStore) {
        self.currentWeatherAPI = currentWeatherAPI
        self.weatherStore = weatherStore
    }
    
    func getCurrentWeatherDataAPI(_ cityName: String) -> Observable<CurrentWeather> {
        return currentWeatherAPI.getCurrentWeather(cityName)
    }
    
    func getForecastWeatherDataAPI(_ cityName: String) -> Observable<ForecastWeather> {
        return currentWeatherAPI.getForcastWeather(cityName)
    }
    
    func storeWeatherData(_ currentWeather: CurrentWeatherViewModel, _ forecastWeather: ForecastWeatherViewModel) {
        weatherStore.storeWeatherData(currentWeather, forecastWeather)
    }
    
    func getCurrentWeatherDataCD() -> Observable<[CurrentWeatherViewModel]> {
        return weatherStore.getCurrentWeather()
    }
    
    func getForecastWeatherDataCD() -> Observable<[ForecastWeatherViewModel]> {
        return weatherStore.getForecastWeather()
    }
}
