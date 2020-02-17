import Foundation

class CityListPresenter {
    
    var weatherUseCase: WeatherUseCase
    weak var weatherDelegate: CurrentWeatherDelegate?
    
    init(weatherUseCase: WeatherUseCase) {
        self.weatherUseCase = weatherUseCase
    }
    
    func getWeatherData(_ cityName: String) {
        weatherUseCase.getWeatherData(handleCurrentWeather: handleCurrentWeather, cityName)
    }
    
    func handleCurrentWeather(weather: CurrentWeather) {
        let weatherViewModel = CurrentWeatherViewModel(weather)
        weatherDelegate?.handldeWeatherData(weatherViewModel: weatherViewModel)
    }
}
