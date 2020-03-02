import Foundation
import RxSwift

class CityListPresenter {
    
    let weatherUseCase: WeatherUseCase
    let navigationService: NavigationService
    
    init(weatherUseCase: WeatherUseCase, navigationService: NavigationService) {
        self.weatherUseCase = weatherUseCase
        self.navigationService = navigationService
    }
    
   func getCurrentWeatherDataAPI(_ cityName: String) -> Observable<CurrentWeatherViewModel> {
        return weatherUseCase
            .getCurrentWeatherDataAPI(cityName)
            .map {CurrentWeatherViewModel($0)}
   }
    
    func getForecastDataAPI(_ cityName: String) -> Observable<ForecastWeatherViewModel> {
         return weatherUseCase
            .getForecastWeatherDataAPI(cityName)
            .map {ForecastWeatherViewModel($0)}
    }
    
    func handleCitySelected(city: CurrentWeatherViewModel) {
        navigationService.pushDetailsWeatherViewController(city: city)
    }
    
    func storeWeatherData(_ currentWeather: CurrentWeatherViewModel, _ forecastWeather: ForecastWeatherViewModel) {
        weatherUseCase.storeWeatherData(currentWeather, forecastWeather)
    }
    
    func getWeatherDataAPI(
        forCityName cityName: String
    ) -> Single<(CurrentWeatherViewModel, ForecastWeatherViewModel)> {
        return Observable
            .combineLatest(
                getCurrentWeatherDataAPI(cityName),
                getForecastDataAPI(cityName))
            .take(1)
            .asSingle()
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
    }
    
    func getCurrentWeatherDataCD() -> Observable<[CurrentWeatherViewModel]> {
         return weatherUseCase.getCurrentWeatherDataCD()
     }
     
     func getForecastWeatherDataCD() -> Observable<[ForecastWeatherViewModel]> {
         return weatherUseCase.getForecastWeatherDataCD()
     }
    
    func getWeatherDataCD() -> Single<([CurrentWeatherViewModel], [ForecastWeatherViewModel])>{
       return Observable
        .combineLatest(
            getCurrentWeatherDataCD(),
            getForecastWeatherDataCD())
        .take(1)
        .asSingle()
    }
}
