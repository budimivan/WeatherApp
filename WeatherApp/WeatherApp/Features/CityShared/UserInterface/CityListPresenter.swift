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
    
    func getForecastWeatherDataAPI(_ cityName: String) -> Observable<ForecastWeatherViewModel> {
         return weatherUseCase
            .getForecastWeatherDataAPI(cityName)
            .map {ForecastWeatherViewModel($0)}
    }
    
    func handleCitySelected(city: CurrentWeatherViewModel) {
        navigationService.pushDetailsWeatherViewController(city: city)
    }
    
    func storeWeatherData(forCityName cityName: String) -> Single<(CurrentWeather, ForecastWeather)> {
        return weatherUseCase.storeWeatherData(forCityName: cityName)
    }

    func getCurrentWeatherDataCD() -> Observable<[CurrentWeatherViewModel]> {
         return weatherUseCase.getCurrentWeatherDataCD()
     }
     
     func getForecastWeatherDataCD() -> Observable<[ForecastWeatherViewModel]> {
         return weatherUseCase.getForecastWeatherDataCD()
     }
    
    func getWeatherData() -> Observable<([CurrentWeatherViewModel], [ForecastWeatherViewModel])>{
       return Observable
        .combineLatest(
            getCurrentWeatherDataCD(),
            getForecastWeatherDataCD())
    }
}
