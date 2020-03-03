import Foundation

class AppDependencies {
        
    func buildCityListPresenter(navigationService: NavigationService) -> CityListPresenter {
        let currentWeatherAPI = CurrentWeatherAPI()
        let coreDataStack = CoreDataStack(modelName: "WeatherApp")
        let weatherStore = WeatherStore(coreDataStack: coreDataStack)
        let weatherDataRepository =  WeatherDataRepository(
            currentWeatherAPI: currentWeatherAPI,
            weatherStore: weatherStore)
        let weatherUseCase = WeatherUseCase(weatherRepository: weatherDataRepository)
        return CityListPresenter(weatherUseCase: weatherUseCase, navigationService: navigationService)
    }
}
