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
    
    func getWeatherData() -> Observable<([WeatherViewModel])>{
        return Observable
            .combineLatest(
                getCurrentWeatherDataCD(),
                getForecastWeatherDataCD())
            .compactMap { weather, forecast in
                guard weather.count == forecast.count else { return nil }
                var array = [WeatherViewModel]()
                for (index, element) in weather.enumerated() {
                    guard let forecast = forecast.at(index) else { return nil }
                    array.append(WeatherViewModel(currentWeather: element, forecastWeather: forecast))
                }
                return array
        }
    }
}
