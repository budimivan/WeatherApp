import Foundation

class CityListPresenter {
    
    let weatherUseCase: WeatherUseCase
    let navigationService: NavigationService
    weak var currentWeatherDelegate: CurrentWeatherDelegate?
    weak var forecastWeatherDelegate: ForecastWeatherDelegate?
    
    init(weatherUseCase: WeatherUseCase, navigationService: NavigationService) {
        self.weatherUseCase = weatherUseCase
        self.navigationService = navigationService
    }
    
   func getWeatherData(_ cityName: String) {
       weatherUseCase.getCurrentWeatherData(handleCurrentWeather: handleCurrentWeather, cityName)
       weatherUseCase.getForecastWeatherData(handleForecastWeather: handleForecastWeather, cityName)
   }
    
    func handleCitySelected(city: CurrentWeatherViewModel) {
        navigationService.pushDetailsWeatherViewController(city: city)
    }
    
    func handleCurrentWeather(weather: CurrentWeather) {
        let weatherViewModel = CurrentWeatherViewModel(weather)
        currentWeatherDelegate?.handleWeatherData(weatherViewModel: weatherViewModel)
    }
    
    func handleForecastWeather(weather: ForecastWeather) {
        let weatherViewModel = ForecastWeatherViewModel(weather)
        forecastWeatherDelegate?.handleForecastData(weatherViewModel: weatherViewModel)
    }
}
