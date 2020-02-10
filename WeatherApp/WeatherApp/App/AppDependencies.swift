import Foundation

class AppDependencies {
    
    var cityListPresenter: CityListPresenter!
    
    init() {
        self.cityListPresenter = buildCityListPresenter()
    }
    
    private func buildCityListPresenter() -> CityListPresenter {
        let currentWeatherAPI = CurrentWeatherAPI()
        let weatherDataRepository =  WeatherDataRepository(currentWeatherAPI: currentWeatherAPI)
        let weatherUseCase = WeatherUseCase(weatherRepository: weatherDataRepository)
        return CityListPresenter(weatherUseCase: weatherUseCase)
    }
}
