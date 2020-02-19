import Foundation

class AppDependencies {
    
    func buildCityListPresenter(navigationService: NavigationService) -> CityListPresenter {
        let currentWeatherAPI = CurrentWeatherAPI()
        let weatherDataRepository =  WeatherDataRepository(currentWeatherAPI: currentWeatherAPI)
        let weatherUseCase = WeatherUseCase(weatherRepository: weatherDataRepository)
        return CityListPresenter(weatherUseCase: weatherUseCase, navigationService: navigationService)
    }
}
