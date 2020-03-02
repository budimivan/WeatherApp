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
    
    func storeWeatherData(forCityName cityName: String) -> Single<(CurrentWeather, ForecastWeather)> {
            return Observable
                .combineLatest(
                   getCurrentWeatherDataAPI(cityName),
                   getForecastWeatherDataAPI(cityName))
                .take(1)
                .asSingle()
                .observeOn(MainScheduler.instance)
                .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
                .do(onSuccess: { [weak self] observerCurrentWeather, observerForecastWeather in
                    self?.weatherStore.storeWeatherData(CurrentWeatherViewModel(observerCurrentWeather), ForecastWeatherViewModel(observerForecastWeather))
                })
        }
        
    func getCurrentWeatherDataCD() -> Observable<[CurrentWeatherViewModel]> {
        return weatherStore.getCurrentWeather()
    }
    
    func getForecastWeatherDataCD() -> Observable<[ForecastWeatherViewModel]> {
        return weatherStore.getForecastWeather()
    }
}
