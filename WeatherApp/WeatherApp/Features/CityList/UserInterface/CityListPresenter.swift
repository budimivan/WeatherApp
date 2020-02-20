import Foundation
import RxSwift

class CityListPresenter {
    
    let weatherUseCase: WeatherUseCase
    let navigationService: NavigationService
    
    init(weatherUseCase: WeatherUseCase, navigationService: NavigationService) {
        self.weatherUseCase = weatherUseCase
        self.navigationService = navigationService
    }
    
   func getCurrentWeatherData(_ cityName: String) -> Single<CurrentWeatherViewModel> {
        return weatherUseCase
            .getCurrentWeatherData(cityName)
            .map {CurrentWeatherViewModel($0)}
   }
    
    func getForecastData(_ cityName: String) -> Single<ForecastWeatherViewModel> {
         return weatherUseCase
            .getForecastWeatherData(cityName)
            .map {ForecastWeatherViewModel($0)}
    }
    
    func handleCitySelected(city: CurrentWeatherViewModel) {
        navigationService.pushDetailsWeatherViewController(city: city)
    }

//    Doing it with delegate
//    func handleForecastWeather(weather: ForecastWeather) {
//        let weatherViewModel = ForecastWeatherViewModel(weather)
//        forecastWeatherDelegate?.handleForecastData(weatherViewModel: weatherViewModel)
//    }
}
